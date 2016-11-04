class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :postal_code

      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
