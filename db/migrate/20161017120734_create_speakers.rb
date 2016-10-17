class CreateSpeakers < ActiveRecord::Migration[5.0]
  def change
    create_table :speakers do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email
      t.text :description
      t.string :twitter
      t.string :linkedin
      t.string :website
      t.integer :participation_year

      t.timestamps
    end
  end
end
