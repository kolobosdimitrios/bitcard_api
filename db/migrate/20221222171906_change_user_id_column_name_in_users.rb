class ChangeUserIdColumnNameInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :user_id, :user_key
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
