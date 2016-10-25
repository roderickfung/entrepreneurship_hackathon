class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|

      t.string :title
      t.string :description
      t.date :start_date
      t.date :end_date
      t.string :aasm_state

      t.timestamps
    end
    add_index :events, [:title, :description]
    add_index :events, [:aasm_state, :start_date, :end_date]
  end
end
