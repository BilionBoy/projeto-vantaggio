# frozen_string_literal: true

class CreateCCentrosCustos < ActiveRecord::Migration[7.2]
  def up
    create_table :c_centros_custos do |t|
      t.string :custo
      t.string :nome
      t.references :c_tipo_centro_custo, null: false, foreign_key: true
      t.references :c_condominio, null: false, foreign_key: true
      t.decimal :valor_inicial, precision: 15, scale: 2
      t.decimal :saldo_atual, precision: 15, scale: 2
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :c_centros_custos if table_exists?(:c_centros_custos)
  end
end
