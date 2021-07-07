class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_type 
      t.integer :product_price
    end
  end
end
