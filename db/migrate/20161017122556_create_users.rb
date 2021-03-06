class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.boolean :activated
      t.string :auth_token

      t.timestamps
    end
    add_index :users, [:email, :auth_token]
  end
end
