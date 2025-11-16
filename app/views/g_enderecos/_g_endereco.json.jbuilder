json.extract! g_endereco, :id, :cep, :rua, :bairro, :numero, :g_municipio_id, :created_at, :updated_at
json.url g_endereco_url(g_endereco, format: :json)
