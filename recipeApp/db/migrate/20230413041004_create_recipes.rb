class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :ingredient
      t.text :cooking_instructions
      t.integer :time_tiken
      t.string :cuisine_type
      t.boolean :is_public
      t.text :dietary_restrictions

      t.timestamps
    end
  end
end
