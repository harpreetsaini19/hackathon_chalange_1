class CreateProductRetailOffers < ActiveRecord::Migration
  def change
    create_table :product_retail_offers do |t|
      t.integer :product_retail_id
      t.float :base_price
      t.string :offer
      t.datetime :expiry
      t.float :discounted_price

      t.timestamps
    end
  end
end
