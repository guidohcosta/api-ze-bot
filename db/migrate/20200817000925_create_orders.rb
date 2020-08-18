class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :client
      t.integer :status_cd, default: 0
      t.string :tracking

      t.timestamps
    end
  end
end
