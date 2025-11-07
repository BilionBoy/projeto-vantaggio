# frozen_string_literal: true
class CTipoCartoesController < ApplicationController
  before_action :set_c_tipo_cartao, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = CTipoCartao.ransack(params[:q])
    @pagy, @c_tipo_cartoes = pagy(@q.result)
  end

  def new
    @c_tipo_cartao = CTipoCartao.new
  end

  def edit
  end

  def create
    @c_tipo_cartao = CTipoCartao.new(c_tipo_cartao_params)

    if @c_tipo_cartao.save
      redirect_to c_tipo_cartoes_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @c_tipo_cartao.update(c_tipo_cartao_params)
      redirect_to c_tipo_cartoes_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @c_tipo_cartao.destroy
      redirect_to c_tipo_cartoes_url, notice: t('messages.deleted_successfully')
    else
      redirect_to c_tipo_cartoes_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_c_tipo_cartao
    @c_tipo_cartao = CTipoCartao.find_by(id: params[:id])
    return redirect_to c_tipo_cartoes_path, alert: t('messages.not_found') unless @c_tipo_cartao
  end

  def c_tipo_cartao_params
    permitted_attributes = CTipoCartao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:c_tipo_cartao).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to c_tipo_cartoes_path, alert: t('messages.not_found')
  end
end
