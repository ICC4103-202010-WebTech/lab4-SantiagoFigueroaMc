class TicketType < ApplicationRecord
  validate :price_validation
  validate :ticket_price, presence: true
  belongs_to :event

  def price_validation
    if ticket_price < 0
      errors.add(:ticket_price, "price should be greater or equal than zero.")
    end
  end
end

