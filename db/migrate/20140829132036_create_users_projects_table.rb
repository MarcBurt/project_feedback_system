class CreateUsersProjectsTable < ActiveRecord::Migration
  def change
    create_table :users_projects, id:false do |t|
      t.belongs_to :user
      t.belongs_to :project
    end
  end
end
