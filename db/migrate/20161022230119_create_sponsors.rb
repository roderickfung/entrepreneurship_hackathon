class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.string :company_name
      t.string :description
      t.string :logo
      t.string :representative

      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
