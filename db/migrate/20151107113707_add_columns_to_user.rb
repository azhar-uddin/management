class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :gender, :string
    add_column :users, :rollnumber, :string
  end
end
