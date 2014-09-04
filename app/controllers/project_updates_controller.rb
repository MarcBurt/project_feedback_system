class ProjectUpdatesController < ApplicationController

    def receive_data(input = {}) # receives a hash from SMS/survey tool/app?
    phone_number = input[:phone] # using phone number to identify the update creator - staff number/usernames are alternatives
    project_name = input[:name]  # project names would either need to be unique or an id passed in here
    title = input[:title]
    content = input[:content]

    project = Project.where(name: project_name).first
    project_id = project.id
    user = User.where(phone: phone_number).first
    user_id = user.id

    data = {project_id: project_id, user_id: user_id, title: title, content: content}
    ProjectUpdate.create(data)
  end
  


end
