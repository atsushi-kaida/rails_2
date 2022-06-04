class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :image_name
      t.string :place
      t.integer :price
      t.string :intro
      t.integer :user_id

      t.timestamps
    end
  end
end
