class AddPaidColumnToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :paid, :boolean
  end
end
