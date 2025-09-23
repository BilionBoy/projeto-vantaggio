# frozen_string_literal: true

class CCartao < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :c_tipo_cartao
  belongs_to :c_nivel_cartao

  
end
