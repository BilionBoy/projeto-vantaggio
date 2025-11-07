class SidebarMenu
  def self.items
    [
      {
        name: 'Home',
        icon: 'ph-house',
        path: :root_path,
        roles: :all
      },
      {
        name: "Tabelas Referenciais",
        icon: "ph-folders",
        submenu: [
          { name: "Tipo Usuários", path: :a_tipo_usuarios_path },
          { name: "Paises", path: :g_paises_path },
          { name: "Estados", path: :g_estados_path },
          { name: "Municípios", path: :g_municipios_path },
          { name: "Bairro", path: :g_bairros_path },
          { name: "Distritos", path: :g_distritos_path },
          { name: "Localidades", path: :g_localidades_path },
        ],
        roles: :all
      }
    ]
  end
end
