class AddCategoryAndDescriptionToSpots < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :category, :string
    add_column :spots, :difficulty, :integer
    add_column :spots, :difficulty_description, :text
  end
end
