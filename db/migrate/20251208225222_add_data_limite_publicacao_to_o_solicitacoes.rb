# frozen_string_literal: true

class AddDataLimitePublicacaoToOSolicitacoes < ActiveRecord::Migration[7.2]
  def up
    # Só cria a coluna se a tabela existir e a coluna ainda não existir
    if table_exists?(:o_solicitacoes)
      unless column_exists?(:o_solicitacoes, :data_limite_publicacao)
        add_column :o_solicitacoes, :data_limite_publicacao, :datetime
      end
    end
  end

  def down
    # Só remove a coluna se existir
    if table_exists?(:o_solicitacoes)
      if column_exists?(:o_solicitacoes, :data_limite_publicacao)
        remove_column :o_solicitacoes, :data_limite_publicacao
      end
    end
  end
end
