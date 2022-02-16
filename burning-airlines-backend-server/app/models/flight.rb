class Flight < ApplicationRecord
    belongs_to :plane
    has_many :reservations
    validates :number, presence: true
    validates :origin, presence: true
    validates :destination, presence: true
    validates :date, presence: true
end
