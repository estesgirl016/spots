class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.belongs_to :user, null: false
      t

      t.timestamps
    end
  end
end
