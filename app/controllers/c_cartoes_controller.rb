# frozen_string_literal: true
class CCartoesController < ApplicationController
  before_action :set_c_cartao, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = CCartao.ransack(params[:q])
    @pagy, @c_cartoes = pagy(@q.result)
  end

  def new
    @c_cartao = CCartao.new
  end

  def edit
  end

  def create
    @c_cartao = CCartao.new(c_cartao_params)

    if @c_cartao.save
      redirect_to c_cartoes_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @c_cartao.update(c_cartao_params)
      redirect_to c_cartoes_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @c_cartao.destroy
      redirect_to c_cartoes_url, notice: t('messages.deleted_successfully')
    else
      redirect_to c_cartoes_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_c_cartao
    @c_cartao = CCartao.find_by(id: params[:id])
    return redirect_to c_cartoes_path, alert: t('messages.not_found') unless @c_cartao
  end

  def c_cartao_params
    permitted_attributes = CCartao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:c_cartao).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to c_cartoes_path, alert: t('messages.not_found')
  end
end
