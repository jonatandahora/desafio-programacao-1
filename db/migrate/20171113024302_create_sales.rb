class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.text :purchaser_name
      t.text :item_description
      t.float :item_price
      t.integer :purchase_count
      t.float :sale_total
      t.text :merchant_address
      t.text :merchant_name

      t.timestamps
    end
  end
end
