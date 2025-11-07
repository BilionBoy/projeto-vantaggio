class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def self.ransackable_attributes(_auth_object = nil)
    %w[]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[]
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map do |assoc|
      assoc.name.to_s
    end
  end
end
