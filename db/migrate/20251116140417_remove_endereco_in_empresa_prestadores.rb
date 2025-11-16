# frozen_string_literal: true

class RemoveEnderecoInEmpresaPrestadores < ActiveRecord::Migration[7.2]
  def up
    remove_column :a_empresas_prestadores, :endereco, if_exists: true
  end

  def down
    add_column :a_empresas_prestadores, :endereco, :string
  end
end
