class Room < ApplicationRecord
	belongs_to :user
	has_many :reservations
	
	validates :name, presence: true
	validates :price, numericality: {only_integer: true}
	validates :place, presence: true
	validates :image_name, presence: true
end
