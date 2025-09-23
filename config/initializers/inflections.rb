# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'g_tipo_usuario', 'g_tipo_usuarios'
  inflect.irregular 'g_status_usuario', 'g_status_usuarios'
  inflect.irregular 'c_condominio', 'c_condominios'
  inflect.irregular 'c_sindico', 'c_sindicos'
  inflect.irregular 'c_tipo_cartao', 'c_tipo_cartoes'
  inflect.irregular 'c_nivel_cartao', 'c_nivel_cartoes'
  inflect.irregular 'c_cartao', 'c_cartoes'
  inflect.irregular 'p_categoria', 'p_categorias'
  inflect.irregular 'p_prestador', 'p_prestadores'



end
