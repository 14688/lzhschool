class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :group_id
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
