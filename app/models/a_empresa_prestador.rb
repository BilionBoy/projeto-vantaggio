# frozen_string_literal: true

class AEmpresaPrestador < ApplicationRecord
  belongs_to :a_status
  belongs_to :g_municipio
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
end
