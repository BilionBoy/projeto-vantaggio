# frozen_string_literal: true
class GEnderecosController < ApplicationController
  before_action :set_g_endereco, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = GEndereco.ransack(params[:q])
    @pagy, @g_enderecos = pagy(@q.result)
  end

  def new
    @g_endereco = GEndereco.new
  end

  def edit
  end

  def create
    @g_endereco = GEndereco.new(g_endereco_params)

    if @g_endereco.save
      redirect_to g_enderecos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_endereco.update(g_endereco_params)
      redirect_to g_enderecos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_endereco.destroy
      redirect_to g_enderecos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to g_enderecos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_g_endereco
    @g_endereco = GEndereco.find_by(id: params[:id])
    return redirect_to g_enderecos_path, alert: t('messages.not_found') unless @g_endereco
  end

  def g_endereco_params
    permitted_attributes = GEndereco.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:g_endereco).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to g_enderecos_path, alert: t('messages.not_found')
  end
end
