class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :project_updates
end
