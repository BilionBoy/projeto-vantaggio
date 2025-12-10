# frozen_string_literal: true

class OOrdemServico < ApplicationRecord
  belongs_to :o_proposta
  belongs_to :c_condominio
  belongs_to :a_empresa_prestador
  belongs_to :o_status
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
end
