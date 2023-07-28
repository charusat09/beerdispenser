class Dispenser < ApplicationRecord
  before_update :calculate_revenue, if: :status_changed?
  validates_presence_of :flow_volume, :price_per_liter

  def calculate_revenue
    return unless status_was == 'open' && status == 'closed'

    time_open = (last_closed_at - last_opened_at).round
    volume = time_open * flow_volume
    self.total_revenue += volume * price_per_liter
  end
end
