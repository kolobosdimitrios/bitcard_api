class AddRemainingPointsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :remaining_points, :integer, :default => 0
  end
end
