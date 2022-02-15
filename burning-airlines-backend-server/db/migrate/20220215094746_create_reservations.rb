class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.text :seat
      t.string :flight_id
      t.string :integer
      t.integer :user_id

      t.timestamps
    end
  end
end
