# frozen_string_literal: true

class ATipoUsuario < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  def to_s
    descricao
  end
end
