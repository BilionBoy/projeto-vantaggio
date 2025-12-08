# frozen_string_literal: true

class CCondominio < ApplicationRecord
  include UpcaseAttributes

  validates :nome, presence: true

end
