# frozen_string_literal: true
class OSolicitacoesController < ApplicationController
  before_action :set_o_solicitacao, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OSolicitacao.ransack(params[:q])
    @pagy, @o_solicitacoes = pagy(@q.result)
    @o_solicitacoes.each(&:update_if_expired!)
  end

  def new
    @o_solicitacao = OSolicitacao.new
    load_centros
  end

  def edit
    load_centros
  end
  def create
    @o_solicitacao = OSolicitacao.new(o_solicitacao_params)
    @o_solicitacao.c_condominio = current_user.c_condominio  
    if @o_solicitacao.save
      redirect_to o_solicitacoes_path, notice: t('messages.created_successfully'), status: :see_other
    else
      load_centros
      render :new, status: :unprocessable_entity
    end
  end


  def update
    if @o_solicitacao.update(o_solicitacao_params)
      redirect_to o_solicitacoes_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      load_centros
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @o_solicitacao.destroy
      redirect_to o_solicitacoes_url, notice: t('messages.deleted_successfully')
    else
      redirect_to o_solicitacoes_url, alert: t('messages.delete_failed_due_to_dependencies')
    end
  end

  def saldo_centro
    centro = CCentroCusto.find_by(id: params[:id])
    render json: { saldo: centro&.saldo_atual.to_f }
  end

  private

  def set_o_solicitacao
    @o_solicitacao = OSolicitacao.find_by(id: params[:id])
    return redirect_to o_solicitacoes_path, alert: t('messages.not_found') unless @o_solicitacao
  end

  def o_solicitacao_params
    allowed = OSolicitacao.column_names.reject { |c| %w[deleted_at created_by updated_by].include?(c) }
    params.require(:o_solicitacao).permit(allowed.map(&:to_sym))
  end

  def load_centros
    @centros_disponiveis = CCentroCusto.all.order(:nome)
  end

  def handle_not_found
    redirect_to o_solicitacoes_path, alert: t('messages.not_found')
  end
end
