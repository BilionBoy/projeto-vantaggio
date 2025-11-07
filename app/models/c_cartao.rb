# frozen_string_literal: true

class CCartao < ApplicationRecord
  belongs_to :c_tipo_cartao
  belongs_to :c_nivel_cartal
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
end
