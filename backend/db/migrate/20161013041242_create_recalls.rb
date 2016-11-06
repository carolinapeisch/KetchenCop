class CreateRecalls < ActiveRecord::Migration
  def change
    create_table :recalls do |t|
      t.references :product, index: true, foreign_key: true
      t.string :reason
      t.references :level, index: true, foreign_key: true
      t.references :region, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true
      t.datetime :date

      t.timestamps null: false
    end
  end
end
