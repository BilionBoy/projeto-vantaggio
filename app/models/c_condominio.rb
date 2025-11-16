# frozen_string_literal: true

class CCondominio < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :user
  belongs_to :g_endereco
  accepts_nested_attributes_for :g_endereco
end
