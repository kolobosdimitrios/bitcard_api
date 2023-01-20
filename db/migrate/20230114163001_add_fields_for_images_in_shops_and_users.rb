class AddFieldsForImagesInShopsAndUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image, :binary
    add_column :products, :image, :binary
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
