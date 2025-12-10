# frozen_string_literal: true

class AddCondominioAndEmpresaToUsers < ActiveRecord::Migration[7.2]
  def up
    unless column_exists?(:users, :c_condominio_id)
      add_reference :users, :c_condominio, foreign_key: true
    end
    unless column_exists?(:users, :a_empresa_prestador_id)
      add_reference :users, :a_empresa_prestador, foreign_key: true
    end
  end

  def down
    remove_reference :users, :c_condominio if column_exists?(:users, :c_condominio_id)
    remove_reference :users, :a_empresa_prestador if column_exists?(:users, :a_empresa_prestador_id)
  end
end
