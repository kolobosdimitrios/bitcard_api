class StopNullPasswords < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :password, :string, :null => false
    
    change_column :users, :password_digest, :string, :null => false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
