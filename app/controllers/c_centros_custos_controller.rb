# frozen_string_literal: true
class CCentrosCustosController < ApplicationController
  before_action :set_c_centro_custo, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = CCentroCusto.ransack(params[:q])
    @pagy, @c_centros_custos = pagy(@q.result)
  end

  def new
    @c_centro_custo = CCentroCusto.new
  end

  def edit
  end

  def create
    @c_centro_custo = CCentroCusto.new(c_centro_custo_params)

    if @c_centro_custo.save
      redirect_to c_centros_custos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @c_centro_custo.update(c_centro_custo_params)
      redirect_to c_centros_custos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @c_centro_custo.destroy
      redirect_to c_centros_custos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to c_centros_custos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_c_centro_custo
    @c_centro_custo = CCentroCusto.find_by(id: params[:id])
    return redirect_to c_centros_custos_path, alert: t('messages.not_found') unless @c_centro_custo
  end

  def c_centro_custo_params
    permitted_attributes = CCentroCusto.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:c_centro_custo).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to c_centros_custos_path, alert: t('messages.not_found')
  end
end
