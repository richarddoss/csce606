class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :vote_option, index: true, foreign_key: true
      
      t.timestamps null: false
    end
    add_index :votes, [:vote_option_id], unique: true
  end
end
