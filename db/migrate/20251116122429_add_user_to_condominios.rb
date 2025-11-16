# frozen_string_literal: true

class AddUserToCondominios < ActiveRecord::Migration[7.2]
  def up
    add_reference :c_condominios, :user, null: false, foreign_key: true
  end

  def down
    remove_reference :c_condominios, :user, foreign_key: true
  end
end
