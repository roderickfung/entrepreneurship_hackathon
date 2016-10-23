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
      t.date :participation_year
      t.string :image

      t.references :event, foreign_key: true
      t.timestamps
    end
    add_index :speakers, [:first_name, :last_name]
    add_index :speakers, [:image, :description]
  end
end
