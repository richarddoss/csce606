class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.text :name
      t.text :major
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
