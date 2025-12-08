# frozen_string_literal: true

class AEmpresaPrestador < ApplicationRecord
  belongs_to :a_status
  belongs_to :g_municipio
  belongs_to :t_taxa


  validates :nome_fantasia, presence: true
  validates :cnpj,          presence: true
  
end
