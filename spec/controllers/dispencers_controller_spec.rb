require 'rails_helper'

RSpec.describe DispensersController, type: :controller do
  let(:dispenser) { Dispenser.create!(flow_volume: 0.5, status: 'closed', last_opened_at: nil, last_closed_at: nil, total_revenue: 0.0, price_per_liter: 5.0) }

  describe 'PUT update' do
    it 'updates the dispenser and redirects' do
      put :update, params: { id: dispenser.id, dispenser: { status: 'open' } }
      dispenser.reload
      expect(dispenser.status).to eq('open')
      expect(dispenser.last_opened_at).to be_present
      expect(response).to redirect_to(dispenser)
    end
  end
end
