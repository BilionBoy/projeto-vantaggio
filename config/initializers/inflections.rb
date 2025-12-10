# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'g_pais',                            'g_paises'
  inflect.irregular 'g_estado',                          'g_estados'
  inflect.irregular 'a_tipo_usuario',                    'a_tipo_usuarios'
  inflect.irregular 'a_status',                          'a_status'
  inflect.irregular 'a_empresa_prestador',               'a_empresas_prestadores' 
  inflect.irregular 'o_tipo_solicitacao',                'o_tipos_solicitacoes'
  inflect.irregular 'o_categoria_servico',               'o_categorias_servicos'
  inflect.irregular 'o_urgencia',                        'o_urgencias'
  inflect.irregular 'o_orcamento',                       'o_orcamentos'
  inflect.irregular 'o_solicitacao',                     'o_solicitacoes'
  inflect.irregular 'o_status',                          'o_status'  
  inflect.irregular 'c_tipo_cartao',                     'c_tipo_cartoes'
  inflect.irregular 'c_nivel_cartao',                    'c_nivel_cartoes'
  inflect.irregular 'c_cartao',                          'c_cartoes'
  inflect.irregular 'c_condominio',                      'c_condominios'
  inflect.irregular 'c_tipo_centro_custo',               'c_tipos_centros_custos'
  inflect.irregular 'c_centro_custo',                    'c_centros_custos'
  inflect.irregular 't_taxa',                            't_taxas'


end
