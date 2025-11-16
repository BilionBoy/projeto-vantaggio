# frozen_string_literal: true

class GMunicipio < ApplicationRecord
  belongs_to :g_estado
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  def to_s
    descricao
  end
end
