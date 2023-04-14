class AddUserToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :users, foreign_key: true
  end
end
