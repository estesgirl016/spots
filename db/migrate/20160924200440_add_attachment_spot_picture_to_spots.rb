class AddAttachmentSpotPictureToSpots < ActiveRecord::Migration
  def self.up
    change_table :spots do |t|
      t.attachment :spot_picture
    end
  end

  def self.down
    remove_attachment :spots, :spot_picture
  end
end
