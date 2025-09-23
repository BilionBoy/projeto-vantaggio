# frozen_string_literal: true
class CSindicosController < ApplicationController
  before_action :set_c_sindico, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = CSindico.ransack(params[:q])
    @pagy, @c_sindicos = pagy(@q.result)
  end

  def new
    @c_sindico = CSindico.new
  end

  def edit
  end

  def create
    @c_sindico = CSindico.new(c_sindico_params)

    if @c_sindico.save
      redirect_to c_sindicos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @c_sindico.update(c_sindico_params)
      redirect_to c_sindicos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @c_sindico.destroy
      redirect_to c_sindicos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to c_sindicos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_c_sindico
    @c_sindico = CSindico.find_by(id: params[:id])
    return redirect_to c_sindicos_path, alert: t('messages.not_found') unless @c_sindico
  end

  def c_sindico_params
    permitted_attributes = CSindico.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:c_sindico).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to c_sindicos_path, alert: t('messages.not_found')
  end
end
