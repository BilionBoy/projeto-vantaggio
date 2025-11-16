# frozen_string_literal: true

class AddEnderecoInCondominio < ActiveRecord::Migration[7.2]
  def up
    remove_column :c_condominios, :endereco, if_exists: true
    add_reference :c_condominios, :g_endereco, null: false, foreign_key: true
  end

  def down
    remove_reference :c_condominios, :g_endereco, foreign_key: true
    add_column :c_condominios, :endereco, :string
  end
end
