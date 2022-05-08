class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :username
      t.string :user_id
      t.date :date_of_birth
      t.string :address
      t.string :email

      t.timestamps
    end
    add_index :users, :user_id, unique: true
  
  end
end