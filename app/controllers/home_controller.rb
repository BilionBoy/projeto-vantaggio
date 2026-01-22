# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    case current_user.a_tipo_usuario&.descricao&.downcase
    when 'admin'
      load_admin_dashboard_data
      render :index
    when 'sindico'
      load_sindico_dashboard_data
      render :sindico
    when 'prestador'
      load_prestador_dashboard_data
      render :prestador
    else
      render :index
    end
  end

  private

  # =========================================================
  # DASHBOARD SÍNDICO
  # =========================================================
  def load_sindico_dashboard_data
    condominio_id = current_user.c_condominio_id
    return unless condominio_id

    solicitacoes = OSolicitacao
                     .joins(:o_status, :c_centro_custo)
                     .where(c_centros_custos: { c_condominio_id: condominio_id })

    @solicitacoes_total      = solicitacoes.count
    @solicitacoes_pendentes  = solicitacoes.where(o_status: { descricao: 'Pendente' }).count
    @solicitacoes_andamento  = solicitacoes.where(o_status: { descricao: 'Em andamento' }).count
    @solicitacoes_concluidas = solicitacoes.where(o_status: { descricao: 'Concluída' }).count

    @propostas_recebidas = OProposta
                             .joins(:o_solicitacao)
                             .where(o_solicitacoes: { id: solicitacoes.select(:id) })
                             .count

    centros = CCentroCusto.where(c_condominio_id: condominio_id)

    @orcamento_total = centros.sum(:valor_inicial).to_f
    @gastos_totais   = centros.sum('valor_inicial - saldo_atual').to_f

    categorias = solicitacoes
                   .joins(:o_categoria_servico)
                   .group('o_categorias_servicos.descricao')
                   .count

    @solicitacoes_por_categoria = categorias.map do |desc, count|
      OpenStruct.new(descricao: desc, count: count)
    end

    @gastos_por_centro = centros.map do |c|
      OpenStruct.new(
        nome:  c.nome,
        valor: (c.valor_inicial.to_f - c.saldo_atual.to_f)
      )
    end
  end

  # =========================================================
  # DASHBOARD PRESTADOR (EQUIVALENTE AO FORNECEDOR DO FROTAS)
  # =========================================================
  def load_prestador_dashboard_data
    prestador_id = current_user.a_empresa_prestador_id
    return unless prestador_id

    # -------------------------------------------------------
    # ORDENS DE SERVIÇO DO PRESTADOR
    # -------------------------------------------------------
    ordens = OOrdemServico
               .joins(:o_status)
               .where(a_empresa_prestador_id: prestador_id)

    status_pago_id = OStatus.find_by(descricao: 'Pago')&.id

    # 💰 Saldo a receber (valor total das OS pagas)
    @saldo_a_receber = ordens
                         .where(o_status_id: status_pago_id)
                         .sum(:valor_total)
                         .to_f

    # 🛠️ Serviços ativos
    @servicos_ativos = ordens
                         .where(o_status: { descricao: 'Ativo' })
                         .count

    # -------------------------------------------------------
    # SOLICITAÇÕES RELACIONADAS ÀS PROPOSTAS DO PRESTADOR
    # -------------------------------------------------------
    solicitacoes = OSolicitacao
                     .joins(:o_propostas)
                     .where(o_propostas: { a_empresa_prestador_id: prestador_id })

    @solicitacoes_pendentes  = solicitacoes.joins(:o_status).where(o_status: { descricao: 'Pendente' }).count
    @solicitacoes_andamento  = solicitacoes.joins(:o_status).where(o_status: { descricao: 'Em andamento' }).count
    @solicitacoes_concluidas = solicitacoes.joins(:o_status).where(o_status: { descricao: 'Concluída' }).count

    # -------------------------------------------------------
    # GRÁFICO: SERVIÇOS POR CATEGORIA
    # -------------------------------------------------------
    categorias = ordens
                   .joins(o_proposta: { o_solicitacao: :o_categoria_servico })
                   .group('o_categorias_servicos.descricao')
                   .count

    @servicos_por_categoria = categorias.map do |desc, count|
      OpenStruct.new(descricao: desc, count: count)
    end

    # -------------------------------------------------------
    # GRÁFICO: MOVIMENTOS FINANCEIROS (SIMPLIFICADO)
    # -------------------------------------------------------
    @movimentos_por_tipo = [
      OpenStruct.new(descricao: 'Recebido', count: ordens.where(o_status_id: status_pago_id).count),
      OpenStruct.new(descricao: 'Em execução', count: ordens.where(o_status: { descricao: 'Ativo' }).count),
      OpenStruct.new(descricao: 'Pendente', count: ordens.where(o_status: { descricao: 'Pendente' }).count)
    ]
  end

  # =========================================================
  # ADMIN (SIMPLES)
  # =========================================================
  def load_admin_dashboard_data
    centros = CCentroCusto.all
  
    @orcamento_total = centros.sum(:valor_inicial).to_f
    @gastos_totais   = centros.sum('valor_inicial - saldo_atual').to_f
    @saldo_disponivel = @orcamento_total - @gastos_totais
  
    pago_status_id = OStatus.find_by!(descricao: "Pago").id

   @receita_taxas = OOrdemServico
     .joins(a_empresa_prestador: :t_taxa)
     .where(o_status_id: pago_status_id)
     .sum(
       "o_ordem_servicos.valor_total * (t_taxas.percentual / 100.0)"
     )
     .to_f  
    solicitacoes = OSolicitacao.joins(:o_status)
  
    status_group = solicitacoes.group('o_status.descricao').count
    @status_labels = status_group.keys
    @solicitacoes_por_status = status_group.values
  
    categorias = solicitacoes
                   .joins(:o_categoria_servico)
                   .group('o_categorias_servicos.descricao')
                   .order(Arel.sql('COUNT(*) DESC'))
                   .limit(6)
                   .count
  
    @categorias_labels = categorias.keys
    @categorias_data   = categorias.values
  
    gastos_centros = centros.map do |c|
      [c.nome, (c.valor_inicial.to_f - c.saldo_atual.to_f)]
    end
  
    @centros_labels = gastos_centros.map(&:first)
    @centros_data   = gastos_centros.map(&:last)
  
    @atividades_recentes = OSolicitacao
                             .includes(:o_status, :c_centro_custo)
                             .order(created_at: :desc)
                             .limit(8)
                             .map do |s|
      {
        descricao: s.descricao || "Solicitação ##{s.id}",
        status: s.o_status.descricao,
        centro_custo: s.c_centro_custo.nome,
        data: s.created_at.strftime('%d/%m/%Y')
      }
    end
  end

end
