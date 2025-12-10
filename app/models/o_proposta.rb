# frozen_string_literal: true

class OProposta < ApplicationRecord
  belongs_to :o_solicitacao
  belongs_to :a_empresa_prestador
  belongs_to :usuario_envio, class_name: "User"
  belongs_to :o_status
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
end
