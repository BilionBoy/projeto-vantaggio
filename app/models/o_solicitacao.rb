# frozen_string_literal: true

class OSolicitacao < ApplicationRecord
  include UpcaseAttributes

  belongs_to :o_status
  belongs_to :o_urgencia
  belongs_to :o_categoria_servico
  belongs_to :c_condominio
  belongs_to :c_centro_custo

  before_validation :set_saldo_snapshot
  before_validation :set_status_pendente, on: :create
  before_validation :set_numero,          on: :create
  before_save      :check_expiration_status

  def set_saldo_snapshot
    self.saldo_snapshot ||= c_centro_custo&.saldo_atual || 0.0
  end

  def set_status_pendente
    self.o_status ||= OStatus.find_by(descricao: 'Pendente')
  end

  def set_numero
    self.numero ||= (OSolicitacao.maximum(:numero) || 0) + 1
  end

  def check_expiration_status
    return unless data_limite_publicacao.present?

    if data_limite_publicacao < Time.current
      vencida = OStatus.find_by(descricao: 'Vencida')
      self.o_status = vencida if vencida.present?
    end
  end
  
  def update_if_expired!
    return unless data_limite_publicacao.present?
    return unless data_limite_publicacao < Time.current
  
    vencida = OStatus.find_by(descricao: "Vencida")
    return if vencida.nil?
    return if o_status_id == vencida.id
  
    update_column(:o_status_id, vencida.id) 
  end

end
