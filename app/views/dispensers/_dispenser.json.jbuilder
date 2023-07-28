json.extract! dispenser, :id, :flow_volume, :status, :last_opened_at, :last_closed_at, :total_revenue, :price_per_liter, :created_at, :updated_at
json.url dispenser_url(dispenser, format: :json)
