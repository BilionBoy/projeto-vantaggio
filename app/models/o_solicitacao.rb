# frozen_string_literal: true

class OSolicitacao < ApplicationRecord
  belongs_to :c_condominio
  belongs_to :o_tipo_solicitacao
  belongs_to :o_urgencia
  belongs_to :c_centro_custo
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
end
