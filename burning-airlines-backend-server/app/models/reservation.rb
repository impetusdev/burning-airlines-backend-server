class Reservation < ApplicationRecord
  belongs_to :flight, optional: true 
  belongs_to :user, optional: true

  validates :seat, presence: true, format: { with: /\A[A-Z]\d+\z/, message: "format incorrect. Please enter seat number in the correct format, e.g. A1." }
  validates_uniqueness_of :seat, scope: [:flight_id] # checks if seat is taken
  validate :seat_limits

  private

  def seat_limits
    unless flight_id == nil
      row = seat[0].ord - 64
      col = seat[1..seat.size].to_i
      plane_rows = self.flight.plane.rows
      plane_cols = self.flight.plane.cols

      if row > plane_rows
        errors.add(:seat, "row doesn't exist. Please capitalize the letter or check the number of rows on the plane for this flight.")
      elsif col < 1
        errors.add(:seat, "column doesn't exist.")
      elsif col > plane_cols
        errors.add(:seat, "column doesn't exist. Check the number of columns on the plane for this flight.")
      end
    end
  end
end
