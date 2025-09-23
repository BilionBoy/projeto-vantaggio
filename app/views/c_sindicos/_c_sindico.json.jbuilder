json.extract! c_sindico, :id, :nome, :email, :telefone, :cpf, :matricula, :c_condominio_id, :g_tipo_usuario_id, :g_status_usuario_id, :created_at, :updated_at
json.url c_sindico_url(c_sindico, format: :json)
