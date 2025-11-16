class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  belongs_to :a_tipo_usuario
  has_many :c_condominios

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

  def update_without_password(params, *options)
    params.delete(:password)
    params.delete(:password_confirmation)

    result = update(params, *options)
    clean_up_passwords
    result
  end

end
