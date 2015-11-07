class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :sname

      t.timestamps null: false
    end
  end
end
