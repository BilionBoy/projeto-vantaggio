# frozen_string_literal: true
class PPrestadoresController < ApplicationController
  before_action :set_p_prestador, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = PPrestador.ransack(params[:q])
    @pagy, @p_prestadores = pagy(@q.result)
  end

  def new
    @p_prestador = PPrestador.new
  end

  def edit
  end

  def create
    @p_prestador = PPrestador.new(p_prestador_params)

    if @p_prestador.save
      redirect_to p_prestadores_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @p_prestador.update(p_prestador_params)
      redirect_to p_prestadores_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @p_prestador.destroy
      redirect_to p_prestadores_url, notice: t('messages.deleted_successfully')
    else
      redirect_to p_prestadores_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_p_prestador
    @p_prestador = PPrestador.find_by(id: params[:id])
    return redirect_to p_prestadores_path, alert: t('messages.not_found') unless @p_prestador
  end

  def p_prestador_params
    permitted_attributes = PPrestador.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:p_prestador).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to p_prestadores_path, alert: t('messages.not_found')
  end
end
