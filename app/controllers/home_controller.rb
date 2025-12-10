class HomeController < ApplicationController
  def index
    case current_user.a_tipo_usuario&.descricao&.downcase
    when 'admin'
      load_admin_dashboard_data
      render :index
    when 'prestador'
      render :prestador
    when 'sindico'
      render :sindico
    else
      render :index
    end
  end

  private

  def load_admin_dashboard_data
    @total_prestadores = ATipoUsuario.where(descricao: "prestador").count
    @total_sindicos = ATipoUsuario.where(descricao: "sindico").count 
    @total_condominios = CCondominio.count
    @aguardando   = OSolicitacao.joins(:o_status).where(o_status: { descricao: "Pendente" }).count
    @andamento    = OSolicitacao.joins(:o_status).where(o_status: { descricao: "Em andamento" }).count
    @concluidas   = OSolicitacao.joins(:o_status).where(o_status: { descricao: "Concluída" }).count
    @prestadores_por_tipo = ATipoUsuario.all.map do |tipo|
      [tipo.descricao, User.where(a_tipo_usuario_id: tipo.id, a_empresa_prestador_id: !nil).count]
    end.to_h
  end
end
