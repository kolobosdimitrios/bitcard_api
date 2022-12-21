class ChangePurchasesRelation < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :user_id, :bigint
    add_reference :purchases, :tokens, foreign_key: true
  end
end
