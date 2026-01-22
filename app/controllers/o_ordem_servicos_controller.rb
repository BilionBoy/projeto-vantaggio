# frozen_string_literal: true

class OOrdemServicosController < ApplicationController
  before_action :set_o_ordem_servico, only: %i[
    show edit update destroy finalizar aprovar pagar
  ]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = OOrdemServico.ransack(params[:q])
    @pagy, @o_ordem_servicos = pagy(@q.result.order(created_at: :desc))
  end



  def update
    if @o_ordem_servico.update(o_ordem_servico_params)
      redirect_to o_ordem_servicos_path,
        notice: "Ordem atualizada com sucesso.",
        status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @o_ordem_servico.destroy
    redirect_to o_ordem_servicos_path,
      notice: "Ordem removida com sucesso."
  end
  # -----------------------------
  # FLUXO DE STATUS
  # -----------------------------

  # Prestador finaliza
  def finalizar
    @o_ordem_servico.update!(
      o_status: OStatus.find_by!(descricao: "Finalizada"),
      data_fim: Time.current
    )
    redirect_to o_ordem_servicos_path, notice: "Serviço finalizado."
  end

  # Síndico aprova
  def aprovar
    @o_ordem_servico.update!(
      o_status: OStatus.find_by!(descricao: "Aprovada")
    )
    redirect_to o_ordem_servicos_path, notice: "OS aprovada."
  end

  # Admin paga
  def pagar
    redirect_unless_admin!

    @o_ordem_servico.confirmar_pagamento!(current_user)

    redirect_to o_ordem_servicos_path, notice: "Pagamento confirmado."
  rescue => e
    redirect_to o_ordem_servicos_path, alert: e.message
  end

  private

  def set_o_ordem_servico
    @o_ordem_servico = OOrdemServico.find(params[:id])
  end

  def redirect_unless_admin!
    redirect_to o_ordem_servicos_path, alert: "Acesso negado" unless current_user.admin?
  end

  def handle_not_found
    redirect_to o_ordem_servicos_path, alert: "Ordem não encontrada"
  end
end
