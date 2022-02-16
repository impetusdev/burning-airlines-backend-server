class ChangeFlightIdToBeIntegerInReservations < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :flight_id, 'integer USING CAST(flight_id AS integer)'
  end
end
