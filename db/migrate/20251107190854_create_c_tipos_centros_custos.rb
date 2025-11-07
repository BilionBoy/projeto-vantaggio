# frozen_string_literal: true

class CreateCTiposCentrosCustos < ActiveRecord::Migration[7.2]
  def up
    create_table :c_tipos_centros_custos do |t|
      t.string :descricao
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :c_tipos_centros_custos if table_exists?(:c_tipos_centros_custos)
  end
end
