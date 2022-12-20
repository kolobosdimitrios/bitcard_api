class CreateTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.string :token, :null => false
      t.belongs_to :user, foreign_key: true, index: {:unique => false}     
      t.timestamps
    end
    # add_index :tokens, :user_id, unique: true
    # add_index :tokens, :token, unique: true
  end
end
