json.extract! o_solicitacao, :id, :c_condominio_id, :responsavel, :telefone, :email, :o_tipo_solicitacao_id, :local, :o_urgencia_id, :c_centro_custo_id, :data_publicacao, :descricao, :created_at, :updated_at
json.url o_solicitacao_url(o_solicitacao, format: :json)
