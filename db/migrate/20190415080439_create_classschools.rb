class CreateClassschools < ActiveRecord::Migration[5.2]
  def change
    create_table :classschools do |t|
      t.string :cname
      t.string :clocationgrade
      t.references :grade, foreign_key: true

      t.timestamps
    end
  end
end
