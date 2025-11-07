# frozen_string_literal: true

class CCentroCusto < ApplicationRecord
  belongs_to :c_tipo_centro_custo
  belongs_to :c_condominio
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
end
