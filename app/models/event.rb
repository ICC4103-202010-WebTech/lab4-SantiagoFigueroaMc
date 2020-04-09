class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true


  belongs_to :event_venue
  has_one :event_stat
end
