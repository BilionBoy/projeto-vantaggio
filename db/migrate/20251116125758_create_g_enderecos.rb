# frozen_string_literal: true

class CreateGEnderecos < ActiveRecord::Migration[7.2]
  def up
    create_table :g_enderecos do |t|
      t.string :cep
      t.string :rua
      t.string :bairro
      t.string :numero
      t.references :g_municipio, null: false, foreign_key: true
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :g_enderecos if table_exists?(:g_enderecos)
  end
end
