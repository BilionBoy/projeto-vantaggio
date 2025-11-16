# frozen_string_literal: true

class AEmpresaPrestador < ApplicationRecord
  belongs_to :a_status
  belongs_to :g_endereco
  accepts_nested_attributes_for :g_endereco
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
end
