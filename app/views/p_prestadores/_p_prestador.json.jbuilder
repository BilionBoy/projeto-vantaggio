json.extract! p_prestador, :id, :empresa_nome, :cnpj, :p_categoria_id, :g_tipo_usuario_id, :g_status_usuario_id, :created_at, :updated_at
json.url p_prestador_url(p_prestador, format: :json)
