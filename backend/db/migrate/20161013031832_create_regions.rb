class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :display_name
      t.references :image, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
