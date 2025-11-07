module SidebarHelper
  def render_sidebar(user)
    return unless user

    if user.admin?
      render 'shared/sidebar/sidebar'
    elsif user.prestador?
      render 'shared/sidebar/sidebar_prestador'
    elsif user.sindico?
      render 'shared/sidebar/sidebar_sindico'
    else
      render 'shared/sidebar/sidebar' 
    end
  end
end