class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :region, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :date

      t.timestamps null: false
    end
  end
end
