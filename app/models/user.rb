# Users set to include donators/recipients and staff on one table with the 'role' column distinguishing them

class User < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_many :project_updates
end
