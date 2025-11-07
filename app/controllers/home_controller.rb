class HomeController < ApplicationController
  def index
    case current_user.a_tipo_usuario&.descricao&.downcase
    when 'admin'
      render :index
    when 'prestador'
      render :prestador
    when 'sindico'
      render :sindico
    else
      render :index
    end
  end

  def prestador
    render :prestador
  end

  def sindico
    render :sindico
  end
end
