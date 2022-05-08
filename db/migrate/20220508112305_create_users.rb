class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name , :null => false
      #Ex:- :null => false
      t.string :surname , :null => false
      t.string :username , :null => false
      t.string :user_id , :null => false
      t.date :date_of_birth , :null => false
      t.string :address , :null => false
      t.string :email , :null => false

      t.timestamps
    end
    add_index :users, :user_id, unique: true
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  
  end
end