# frozen_string_literal: true
class AEmpresasPrestadoresController < ApplicationController
  before_action :set_a_empresa_prestador, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = AEmpresaPrestador.ransack(params[:q])
    @pagy, @a_empresas_prestadores = pagy(@q.result)
  end

  def new
    @a_empresa_prestador = AEmpresaPrestador.new
  end

  def edit
  end

  def create
    @a_empresa_prestador = AEmpresaPrestador.new(a_empresa_prestador_params)

    if @a_empresa_prestador.save
      redirect_to a_empresas_prestadores_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @a_empresa_prestador.update(a_empresa_prestador_params)
      redirect_to a_empresas_prestadores_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @a_empresa_prestador.destroy
      redirect_to a_empresas_prestadores_url, notice: t('messages.deleted_successfully')
    else
      redirect_to a_empresas_prestadores_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_a_empresa_prestador
    @a_empresa_prestador = AEmpresaPrestador.find_by(id: params[:id])
    return redirect_to a_empresas_prestadores_path, alert: t('messages.not_found') unless @a_empresa_prestador
  end

  def a_empresa_prestador_params
    permitted_attributes = AEmpresaPrestador.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:a_empresa_prestador).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to a_empresas_prestadores_path, alert: t('messages.not_found')
  end
end
