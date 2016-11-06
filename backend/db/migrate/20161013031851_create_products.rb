class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :upc_code
      t.string :product_code
      t.datetime :sell_by_date
      t.references :image, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
