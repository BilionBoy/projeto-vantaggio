# frozen_string_literal: true

class ChangeForeignKeysEmpresaPrestadores < ActiveRecord::Migration[7.2]
  def up
    remove_reference :a_empresas_prestadores, :g_municipio, foreign_key: true
    
    add_reference :a_empresas_prestadores, :g_endereco, null: false, foreign_key: true
  end

  def down
    remove_reference :a_empresas_prestadores, :g_endereco, foreign_key: true
    
    add_reference :a_empresas_prestadores, :g_municipio, foreign_key: true
  end
end
