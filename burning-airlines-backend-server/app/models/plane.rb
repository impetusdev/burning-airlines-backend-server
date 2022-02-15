class Plane < ApplicationRecord
    has_many :flights 
    validates :name, presence: true, uniqueness: true
    validates :rows, presence: true
    validates :cols, presence: true
end
