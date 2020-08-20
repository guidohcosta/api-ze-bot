class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.boolean :on_sale, default: false
      t.decimal :price

      t.timestamps
    end
  end
end
