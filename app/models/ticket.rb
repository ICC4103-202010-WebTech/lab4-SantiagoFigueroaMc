class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  before_create :update_stats

  private

    def update_stats
      es = self.ticket_type.event.event_stat
      ev = self.ticket_type.event.event_venue
      if es.tickets_sold >= ev.capacity
        errors.add(:order_id, "There are no more available tickets for this event")
      else
        es.tickets_sold += 1
      end

    end
end
