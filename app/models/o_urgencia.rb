# frozen_string_literal: true

class OUrgencia < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  include UpcaseAttributes

  validates :descricao, presence: true

end
