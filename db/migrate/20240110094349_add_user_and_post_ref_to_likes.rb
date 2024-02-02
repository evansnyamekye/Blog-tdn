# frozen_string_literal: true

class AddUserAndPostRefToLikes < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    add_reference :likes, :user, null: false, foreign_key: true
    add_reference :likes, :post, null: false, foreign_key: true
  end
end