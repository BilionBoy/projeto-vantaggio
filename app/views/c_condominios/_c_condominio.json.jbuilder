json.extract! c_condominio, :id, :nome, :endereco, :unidade, :created_at, :updated_at
json.url c_condominio_url(c_condominio, format: :json)
