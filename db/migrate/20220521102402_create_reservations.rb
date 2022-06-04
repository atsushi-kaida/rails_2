class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :room_id
      t.datetime :start_day
      t.datetime :end_day
      t.integer :people_count

      t.timestamps
    end
  end
end
