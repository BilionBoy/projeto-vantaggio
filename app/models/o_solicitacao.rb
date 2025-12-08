# frozen_string_literal: true

class OSolicitacao < ApplicationRecord
  belongs_to :a_status
  belongs_to :o_urgencia
  belongs_to :o_categoria_servico
  belongs_to :c_condominio
  belongs_to :c_centro_custo

  before_validation :set_saldo_snapshot
  before_validation :set_status_pendente, on: :create
  
  def set_saldo_snapshot
    self.saldo_snapshot ||= c_centro_custo&.saldo_atual || 0.0
  end

  def set_status_pendente
    self.o_status ||= OStatus.find_by(descricao: 'Pendente')
  end

end
