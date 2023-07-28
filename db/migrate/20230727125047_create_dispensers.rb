class CreateDispensers < ActiveRecord::Migration[7.0]
  def change
    create_table :dispensers do |t|
      t.float :flow_volume
      t.string :status
      t.datetime :last_opened_at
      t.datetime :last_closed_at
      t.float :total_revenue
      t.float :price_per_liter

      t.timestamps
    end
  end
end
