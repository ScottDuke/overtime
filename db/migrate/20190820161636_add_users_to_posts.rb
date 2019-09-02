# frozen_string_literal: true

class AddUsersToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true, index: true
  end
end
