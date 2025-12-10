json.extract! o_proposta, :id, :o_solicitacao_id, :a_empresa_prestador_id, :usuario_envio_id, :o_status_id, :valor_total, :prazo_execucao_dias, :validade_proposta, :observacao, :created_by, :updated_by, :deleted_at, :created_at, :updated_at
json.url o_proposta_url(o_proposta, format: :json)
