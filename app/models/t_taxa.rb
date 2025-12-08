# frozen_string_literal: true

class TTaxa < ApplicationRecord
  belongs_to :a_status
  has_many   :a_empresas_prestadores, dependent: :restrict_with_error
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  
  def nome_com_percentual
    "#{nome} - #{percentual.to_s.gsub('.', ',')}%"
  end
end
