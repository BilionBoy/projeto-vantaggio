# frozen_string_literal: true
class OOrdemServicosController < ApplicationController
  before_action :set_o_ordem_servico, only: %i[show edit update destroy finalizar aprovar pagar]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OOrdemServico.ransack(params[:q])
    @pagy, @o_ordem_servicos = pagy(@q.result.order(created_at: :desc))
  end

  def new
    @o_ordem_servico = OOrdemServico.new
  end

  def edit; end

  def create
    @o_ordem_servico = OOrdemServico.new(o_ordem_servico_params)

    if @o_ordem_servico.save
      redirect_to o_ordem_servicos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @o_ordem_servico.update(o_ordem_servico_params)
      redirect_to o_ordem_servicos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_ordem_servico.destroy
      redirect_to o_ordem_servicos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_ordem_servicos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  # ----------------------------------------------------
  # NOVO: Fluxo do condomínio
  # ----------------------------------------------------

  # Prestador finaliza a OS
  def finalizar
    @o_ordem_servico.update(
      o_status: OStatus.find_by(descricao: "Finalizada"),
      data_fim: Time.current
    )
    redirect_to o_ordem_servicos_path, notice: "Serviço finalizado pelo prestador."
  end

  # Síndico aprova a OS finalizada
  def aprovar
    @o_ordem_servico.update(
      o_status: OStatus.find_by(descricao: "Aprovada")
    )
    redirect_to o_ordem_servicos_path, notice: "OS aprovada pelo síndico."
  end

  # Admin realiza o pagamento
  def pagar
    @o_ordem_servico.update(
      o_status: OStatus.find_by(descricao: "Paga")
    )
    redirect_to o_ordem_servicos_path, notice: "Pagamento confirmado."
  end

  private

  def set_o_ordem_servico
    @o_ordem_servico = OOrdemServico.find_by(id: params[:id])
    return redirect_to o_ordem_servicos_path, alert: t('messages.not_found') unless @o_ordem_servico
  end

  def o_ordem_servico_params
    permitted_attributes = OOrdemServico.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:o_ordem_servico).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to o_ordem_servicos_path, alert: t('messages.not_found')
  end
end
