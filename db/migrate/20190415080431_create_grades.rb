class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.string :gname
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
