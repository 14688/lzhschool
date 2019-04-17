class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :sname
      t.string :ssite
      t.bigint :sphone

      t.timestamps
    end
  end
end
