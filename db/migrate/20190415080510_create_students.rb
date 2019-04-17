class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.bigint :unumber
      t.string :uname
      t.bigint :usex
      t.bigint :uage
      t.string :uemail
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
