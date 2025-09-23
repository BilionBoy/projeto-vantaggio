# frozen_string_literal: true

class CreateCCondominios < ActiveRecord::Migration[7.2]
  def up
    create_table :c_condominios do |t|
      t.string :nome
      t.string :endereco
      t.string :unidade
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :c_condominios
  end
end
