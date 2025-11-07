# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'g_pais', 'g_paises'
  inflect.irregular 'g_estado', 'g_estados'
  inflect.irregular 'a_tipo_usuario', 'a_tipo_usuarios'
end
