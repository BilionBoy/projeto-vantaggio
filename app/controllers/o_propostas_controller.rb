# frozen_string_literal: true
class OPropostasController < ApplicationController
  before_action :set_solicitacao, only: %i[new create]
  before_action :set_o_proposta, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  # Prestador → vê solicitações para enviar proposta
  # Condomínio → vê propostas recebidas
  def index
    if current_user.a_empresa_prestador_id.present?
      @q = OSolicitacao.ransack(params[:q])

      solicitacoes_result =
        @q.result
          .includes(:c_condominio, :o_categoria_servico, :o_status)
          .where(o_status: OStatus.find_by(descricao: "Pendente"))

      @pagy, @solicitacoes = pagy(solicitacoes_result.order(created_at: :desc))
    else
      @q = OProposta
            .includes(:o_solicitacao, :a_empresa_prestador, :o_status)
            .ransack(params[:q])

      propostas_result =
        @q.result
          .joins(:o_solicitacao)
          .where(o_solicitacoes: { c_condominio_id: current_user.c_condominio_id })

      @pagy, @o_propostas = pagy(propostas_result.order(created_at: :desc))
    end
  end

  def show; end

  def new
    @o_proposta = OProposta.new(
      o_solicitacao: @solicitacao,
      o_status: OStatus.find_by(descricao: "Pendente")
    )
  end

  def create
    @o_proposta = OProposta.new(o_proposta_params)
    @o_proposta.o_solicitacao = @solicitacao
    @o_proposta.a_empresa_prestador_id = current_user.a_empresa_prestador_id
    @o_proposta.usuario_envio_id = current_user.id
    @o_proposta.o_status = OStatus.find_by(descricao: "Pendente")

    if @o_proposta.save
      redirect_to o_propostas_path, notice: "Proposta enviada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @o_proposta.update(o_proposta_params)
      redirect_to o_propostas_path, notice: "Proposta atualizada com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @o_proposta.destroy
    redirect_to o_propostas_url, notice: "Proposta removida com sucesso."
  end

  def recebidas
    unless current_user.c_condominio_id.present?
      return redirect_to root_path, alert: "Apenas condomínios podem visualizar propostas recebidas."
    end
  
    @q = OProposta
          .joins(:o_solicitacao)
          .where(o_solicitacoes: { c_condominio_id: current_user.c_condominio_id })
          .includes(:a_empresa_prestador, :usuario_envio, :o_status, :o_solicitacao)
          .ransack(params[:q])
  
    @pagy, @o_propostas = pagy(@q.result.order(created_at: :desc))
  end

  private

  def set_solicitacao
    @solicitacao = OSolicitacao.find(params[:o_solicitacao_id])
  end

  def set_o_proposta
    @o_proposta = OProposta.find(params[:id])
  end

  def o_proposta_params
    params.require(:o_proposta).permit(
      :valor_total, :prazo_execucao_dias, :validade_proposta, :observacao
    )
  end

  def handle_not_found
    redirect_to o_propostas_path, alert: "Registro não encontrado"
  end
end
