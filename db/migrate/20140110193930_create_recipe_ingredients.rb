class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :ingredient_recipes do |t|
      t.belongs_to :ingredient
      t.belongs_to :recipe
    end
  end
end
