# frozen_string_literal: true

class PPrestador < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :p_categoria
  belongs_to :g_tipo_usuario
  belongs_to :g_status_usuario
end
