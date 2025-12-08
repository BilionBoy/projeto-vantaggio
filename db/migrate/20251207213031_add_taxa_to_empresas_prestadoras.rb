# frozen_string_literal: true

class AddTaxaToEmpresasPrestadoras < ActiveRecord::Migration[7.2]
  def up
    # Só executa se a tabela existir
    return unless table_exists?(:a_empresas_prestadores)

    # Adiciona coluna somente se ainda não existir
    unless column_exists?(:a_empresas_prestadores, :t_taxa_id)
      add_column :a_empresas_prestadores, :t_taxa_id, :bigint
    end

    # Define NOT NULL somente se a coluna existir
    if column_exists?(:a_empresas_prestadores, :t_taxa_id)
      change_column_null :a_empresas_prestadores, :t_taxa_id, false
    end

    # Adiciona FK somente se ainda não existir
    unless foreign_key_exists?(:a_empresas_prestadores, :t_taxas)
      add_foreign_key :a_empresas_prestadores, :t_taxas
    end

    # 🔥 adiciona índice para performance (somente se não existir)
    unless index_exists?(:a_empresas_prestadores, :t_taxa_id)
      add_index :a_empresas_prestadores, :t_taxa_id
    end
  end

  def down
    return unless table_exists?(:a_empresas_prestadores)

    # Remove FK com segurança
    if foreign_key_exists?(:a_empresas_prestadores, :t_taxas)
      remove_foreign_key :a_empresas_prestadores, :t_taxas
    end

    # Remove índice
    if index_exists?(:a_empresas_prestadores, :t_taxa_id)
      remove_index :a_empresas_prestadores, :t_taxa_id
    end

    # Remove coluna
    if column_exists?(:a_empresas_prestadores, :t_taxa_id)
      remove_column :a_empresas_prestadores, :t_taxa_id
    end
  end
end
