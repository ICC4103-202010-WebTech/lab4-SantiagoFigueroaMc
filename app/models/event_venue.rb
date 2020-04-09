class EventVenue < ApplicationRecord
  validate :capacity_validation
  validates :name, presence: true
  validates :capacity, presence: true # integer > 10
  validates :address, presence: true
  has_many :events

  def capacity_validation
    if capacity < 10
      errors.add(:capacity, "capacity should be greater or equal than ten.")
    end
  end
end
