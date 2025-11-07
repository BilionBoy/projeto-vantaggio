class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    tipo = user.a_tipo_usuario&.descricao&.downcase

    case tipo
    when 'admin'
      Abilities::AdminAbility.new(self, user)
    when 'gestor'
      Abilities::PrestadorAbility.new(self, user)
    when 'fornecedor'
      Abilities::SindicoAbility.new(self, user)
    end
  end
end