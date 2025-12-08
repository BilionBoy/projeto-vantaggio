json.extract! o_solicitacao, :id, :numero, :descricao, :observacao, :a_status_id, :o_urgencia_id, :o_tipo_solicitacao_id, :o_categoria_servico_id, :c_condominio_id, :created_by, :updated_by, :deleted_at, :created_at, :updated_at
json.url o_solicitacao_url(o_solicitacao, format: :json)
