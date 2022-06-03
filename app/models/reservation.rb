class Reservation < ApplicationRecord
  belongs_to :room

  validates :start_day, comparison: {greater_than_or_equal_to: Time.now.to_date}
	validates :end_day, comparison: {greater_than_or_equal_to: :end_day}
  validates :people_count, presence: true
end
