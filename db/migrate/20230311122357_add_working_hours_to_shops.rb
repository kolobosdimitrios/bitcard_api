class AddWorkingHoursToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :working_hours, :string, :default => "{}"
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
