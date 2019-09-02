# frozen_string_literal: true

class AddStateToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :state, :string
  end
end
