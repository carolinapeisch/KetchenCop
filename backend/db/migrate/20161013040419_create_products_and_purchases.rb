class CreateProductsAndPurchases < ActiveRecord::Migration
  def change
    create_table :products_and_purchases, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :purchase, index: true
    end
  end
end
