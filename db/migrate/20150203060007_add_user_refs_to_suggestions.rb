class AddUserRefsToSuggestions < ActiveRecord::Migration
  def change
    add_reference :suggestions, :user, index: true
    add_foreign_key :suggestions, :users
  end
end
