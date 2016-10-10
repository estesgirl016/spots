class CreateSpotPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :spot_pictures do |t|
      t.belongs_to :user
      t.belongs_to :spot
      t.timestamps
    end
  end
end
