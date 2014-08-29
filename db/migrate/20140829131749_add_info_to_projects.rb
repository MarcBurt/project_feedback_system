class AddInfoToProjects < ActiveRecord::Migration
  def change

    add_column :projects, :name, :string
  end
end
