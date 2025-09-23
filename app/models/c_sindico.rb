# frozen_string_literal: true

class CSindico < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :c_condominio
  belongs_to :g_tipo_usuario
  belongs_to :g_status_usuario
end
