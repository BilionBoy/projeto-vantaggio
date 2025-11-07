# frozen_string_literal: true

class CreateCCartoes < ActiveRecord::Migration[7.2]
  def up
    create_table :c_cartoes do |t|
      t.string :codigo_cartao
      t.string :qrcode
      t.references :c_tipo_cartao, null: false, foreign_key: true
      t.references :c_nivel_cartao, null: false, foreign_key: true
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :c_cartoes
  end
end