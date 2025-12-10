json.extract! o_ordem_servico, :id, :o_proposta_id, :c_condominio_id, :a_empresa_prestador_id, :valor_total, :prazo_execucao_dias, :data_inicio, :data_fim, :o_status_id, :created_at, :updated_at
json.url o_ordem_servico_url(o_ordem_servico, format: :json)
