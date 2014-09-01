class AddInfoToProjectUpdate < ActiveRecord::Migration
  def change
    add_column :project_updates, :title, :string
    add_column :project_updates, :content, :text
    add_column :project_updates, :project_id, :integer
    add_column :project_updates, :user_id, :integer
  end
end
