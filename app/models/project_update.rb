class ProjectUpdate < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  def initialise(data = {})
    project_id = data{:project_id}
    user_id = data{:user_id}
    title = data{:title}
    content = data{:content}

  end


end
