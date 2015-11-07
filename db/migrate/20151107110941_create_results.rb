class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :user, index: true
      t.string :sname
      t.integer :marks

      t.timestamps null: false
    end
    add_foreign_key :results, :users
  end
end
