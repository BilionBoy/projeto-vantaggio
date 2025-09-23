# frozen_string_literal: true

class CreateCNivelCartoes < ActiveRecord::Migration[7.2]
  def up
    create_table :c_nivel_cartoes do |t|
      t.string :descricao
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :c_nivel_cartoes
  end
end
