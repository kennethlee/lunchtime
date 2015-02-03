class AddNameToSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestions, :name, :string
  end
end
