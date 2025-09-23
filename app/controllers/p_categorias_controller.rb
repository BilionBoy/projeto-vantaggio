# frozen_string_literal: true
class PCategoriasController < ApplicationController
  before_action :set_p_categoria, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = PCategoria.ransack(params[:q])
    @pagy, @p_categorias = pagy(@q.result)
  end

  def new
    @p_categoria = PCategoria.new
  end

  def edit
  end

  def create
    @p_categoria = PCategoria.new(p_categoria_params)

    if @p_categoria.save
      redirect_to p_categorias_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @p_categoria.update(p_categoria_params)
      redirect_to p_categorias_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @p_categoria.destroy
      redirect_to p_categorias_url, notice: t('messages.deleted_successfully')
    else
      redirect_to p_categorias_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_p_categoria
    @p_categoria = PCategoria.find_by(id: params[:id])
    return redirect_to p_categorias_path, alert: t('messages.not_found') unless @p_categoria
  end

  def p_categoria_params
    permitted_attributes = PCategoria.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:p_categoria).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to p_categorias_path, alert: t('messages.not_found')
  end
end
