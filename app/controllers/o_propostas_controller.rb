# frozen_string_literal: true
class OPropostasController < ApplicationController
  before_action :set_o_proposta, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
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

      propostas_result = @q.result.joins(:o_solicitacao)
                         .where(o_solicitacoes: { c_condominio_id: current_user.c_condominio_id })

      @pagy, @o_propostas = pagy(propostas_result.order(created_at: :desc))
    end
  end


  def show
  end

  def new
    @o_proposta = OProposta.new
  end

  def edit
  end

  def create
    @o_proposta = OProposta.new(o_proposta_params)

    if @o_proposta.save
      redirect_to o_propostas_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @o_proposta.update(o_proposta_params)
      redirect_to o_propostas_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_proposta.destroy
      redirect_to o_propostas_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_propostas_url, alert: t('messages.delete_failed_due_to_dependencies')
    end
  end

  private

  def set_o_proposta
    @o_proposta = OProposta.find_by(id: params[:id])
    return redirect_to o_propostas_path, alert: t('messages.not_found') unless @o_proposta
  end

  def o_proposta_params
    permitted_attributes =
      OProposta.column_names.reject { |col| %w[id created_at updated_at deleted_at created_by updated_by].include?(col) }

    params.require(:o_proposta).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to o_propostas_path, alert: t('messages.not_found')
  end
end
