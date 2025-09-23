# frozen_string_literal: true
class GStatusUsuariosController < ApplicationController
  before_action :set_g_status_usuario, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = GStatusUsuario.ransack(params[:q])
    @pagy, @g_status_usuarios = pagy(@q.result)
  end

  def new
    @g_status_usuario = GStatusUsuario.new
  end

  def edit
  end

  def create
    @g_status_usuario = GStatusUsuario.new(g_status_usuario_params)

    if @g_status_usuario.save
      redirect_to g_status_usuarios_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_status_usuario.update(g_status_usuario_params)
      redirect_to g_status_usuarios_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_status_usuario.destroy
      redirect_to g_status_usuarios_url, notice: t('messages.deleted_successfully')
    else
      redirect_to g_status_usuarios_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_g_status_usuario
    @g_status_usuario = GStatusUsuario.find_by(id: params[:id])
    return redirect_to g_status_usuarios_path, alert: t('messages.not_found') unless @g_status_usuario
  end

  def g_status_usuario_params
    permitted_attributes = GStatusUsuario.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:g_status_usuario).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to g_status_usuarios_path, alert: t('messages.not_found')
  end
end
