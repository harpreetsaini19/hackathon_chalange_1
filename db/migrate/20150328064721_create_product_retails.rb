class CreateProductRetails < ActiveRecord::Migration
  def change
    create_table :product_retails do |t|
      t.string :product_name
      t.string :retail_name
      t.float :base_price

      t.timestamps
    end
  end
end
