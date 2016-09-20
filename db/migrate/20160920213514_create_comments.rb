class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :spot, foreign_key: true, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
