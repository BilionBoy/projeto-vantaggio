module SidebarHelper
  def user_has_role?(*roles)
    current_user && roles.include?(current_user.role&.name)
  end
  def sidebar_background_style
    if user_has_role?("Alimentação", "Secretaria Regional", "Coordenador Regional", "Preposto", "Comissão Disciplinar")
      "background: linear-gradient(to right, #09304c, #0b4973);"
    elsif session[:evento_etapa] == "OLÍMPICO"
      "background: linear-gradient(to right, #09304c, #0b4973);"
    else
      "background: linear-gradient(to right, #03a62d, #07a15d);"
    end
  end
end