class SidebarMenu
  def self.items(current_user = nil)
    all_items = [
      {
        name: 'Home',
        icon: 'ph-house',
        path: :root_path,
        roles: :all
      },
      {
        name: 'Usuários',
        icon: 'ph-users',
        path: :users_path,
        roles: ['admin']
      },
      {
        name: "Tabelas Referenciais",
        icon: "ph-folders",
        submenu: [
          { name: "Tipo Usuários", path: :a_tipo_usuarios_path },
          { name: "Paises", path: :g_paises_path },
          { name: "Estados", path: :g_estados_path },
          { name: "Municípios", path: :g_municipios_path },
          { name: "Bairros", path: :g_bairros_path },
          { name: "Distritos", path: :g_distritos_path },
          { name: "Localidades", path: :g_localidades_path },
        ],
        roles: ['admin']
      }
    ]

    # Se o usuário for admin, vê tudo
    return all_items if current_user&.a_tipo_usuario&.descricao&.downcase == 'admin'

    # Caso contrário, filtra conforme roles
    all_items.select do |item|
      item[:roles] == :all ||
        (item[:roles].is_a?(Array) && item[:roles].include?(current_user&.a_tipo_usuario&.descricao&.downcase))
    end
  end
end
