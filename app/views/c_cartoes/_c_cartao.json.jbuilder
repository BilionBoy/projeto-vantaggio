json.extract! c_cartao, :id, :codigo_cartao, :qrcode, :c_tipo_cartao_id, :c_nivel_cartal_id, :created_at, :updated_at
json.url c_cartao_url(c_cartao, format: :json)
