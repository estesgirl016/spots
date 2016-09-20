class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :spot, foreign_key: true
      t.string :street
      t.string :city
      t.string :state, null: false
      t.string :zip
      t.string :country, null: false

      t.timestamps
    end
  end
end
