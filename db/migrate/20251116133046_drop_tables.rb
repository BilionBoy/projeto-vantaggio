# frozen_string_literal: true

class DropTables < ActiveRecord::Migration[7.2]
  def up
    drop_table :g_localidades, if_exists: true
    drop_table :g_distritos, if_exists: true
    drop_table :g_bairros, if_exists: true
  end

  def down
  end
end
