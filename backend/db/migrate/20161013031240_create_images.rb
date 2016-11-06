class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :category
      t.string :filename
      t.string :description

      t.timestamps null: false
    end
  end
end
