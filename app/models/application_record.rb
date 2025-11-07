class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at created_by deleted_at updated_at updated_by descricao id nome]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[user]
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map do |assoc|
      assoc.name.to_s
    end
  end
end
