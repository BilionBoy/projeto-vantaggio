# frozen_string_literal: true
class CCondominiosController < ApplicationController
  before_action :set_c_condominio, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = CCondominio.ransack(params[:q])
    @pagy, @c_condominios = pagy(@q.result)
  end

  def new
    @c_condominio = CCondominio.new
    @c_condominio.build_g_endereco
    @sindicos = User.where(a_tipo_usuario: 3)
  end

  def edit
  end

  def create
    @c_condominio = CCondominio.new(c_condominio_params)

    if @c_condominio.save
      redirect_to c_condominios_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @c_condominio.update(c_condominio_params)
      redirect_to c_condominios_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @c_condominio.destroy
      redirect_to c_condominios_url, notice: t('messages.deleted_successfully')
    else
      redirect_to c_condominios_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_c_condominio
    @c_condominio = CCondominio.find_by(id: params[:id])
    return redirect_to c_condominios_path, alert: t('messages.not_found') unless @c_condominio
  end

  def c_condominio_params
    permitted_attributes = CCondominio.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:c_condominio).permit(permitted_attributes.map(&:to_sym),
    :g_endereco_id,
    g_endereco_attributes: [ :cep, :rua , :bairro, :numero, :g_municipio_id ])
  end

  def handle_not_found
    redirect_to c_condominios_path, alert: t('messages.not_found')
  end
end
