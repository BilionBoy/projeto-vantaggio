class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :a_tipo_usuario


  # Helpers para tipos de usuário
  def admin?
    a_tipo_usuario&.descricao&.downcase == "admin"
  end

  def prestador?
    a_tipo_usuario&.descricao&.downcase == "prestador"
  end

  def sindico?
    a_tipo_usuario&.descricao&.downcase == "sindico"
  end

end
