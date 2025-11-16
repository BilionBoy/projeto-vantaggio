# frozen_string_literal: true

class GEstado < ApplicationRecord
  belongs_to :g_pais
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  def to_s
    descricao
  end
end
