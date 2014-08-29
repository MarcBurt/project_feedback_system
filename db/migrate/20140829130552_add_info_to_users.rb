class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :phone, :integer
    add_column :users, :type, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
   end
end
