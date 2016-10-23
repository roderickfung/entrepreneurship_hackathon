class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|

      t.string :first_name
      t.string :last_name
      t.string :email

      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
