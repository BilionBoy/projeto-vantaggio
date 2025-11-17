# frozen_string_literal: true

class OTipoSolicitacao < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  def to_s
    descricao
  end
end
