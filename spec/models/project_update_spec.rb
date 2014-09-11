require 'rails_helper'

describe "belongs to a project and user" do

  before(:each) do
    @user1 = create(:user, first_name: "Test")
    @project1 = create(:project, name: "Test Project")
    ProjectUpdate.skip_callback(:create, :after, :send_update)
    @project_update = create(:project_update, title: "Title1", user_id: @user1.id, project_id: @project1.id)
  end

  it "should belong to a user" do
    @user1.project_updates << @project_update
    expect(@project_update.user.first_name).to eq "Test"
    expect(@user1.project_updates.count).to eq 1
  end

  it "should belong to a project" do
    @project1.project_updates << @project_update
    expect(@project_update.project.name).to eq "Test Project"
    expect(@project1.project_updates.count).to eq 1
  end
end

describe "receive_data" do
  before :each do
    @user = create(:user, first_name: "Test Creator", phone: 111)
    @project = create(:project, name: "Test Project")    
  end

  describe "when user is part of the project" do
    before :each do
      @project.users << @user
    end

    it "should find the user and project based on input" do
      hash = { phone: 111, name: "Test Project", title: "Project Update 1", content: "content for update 1" }
      ProjectUpdate.receive_data(hash)
      update = ProjectUpdate.where(title: "Project Update 1").first
      expect(update.user.first_name).to eq "Test Creator"
      expect(update.project.name).to eq "Test Project"
    end

    it "should not create if a field is missing" do
      hash = { phone: 111, name: "Test Project", title: "Project Update 1"}
      update = ProjectUpdate.receive_data(hash)
      expect(ProjectUpdate.count).to eq 0
    end

  end

  describe "when the user is not part of the project" do

    it "should not create the ProjectUpdate" do
      hash = { phone: 111, name: "Test Project", title: "Project Update 2", content: "this shouldn't exist" }
      ProjectUpdate.receive_data(hash)
      expect(ProjectUpdate.count).to eq 0
    end
  end
end