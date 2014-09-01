require 'rails_helper'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

describe "belongs to a project and user" do

  before(:each) do
    @user1 = create(:user, first_name: "Test")
    @project1 = create(:project, name: "Test Project")
    # @project_update = create(:update)
    @project_update = ProjectUpdate.new( title: "Title1", content: "Update Content!")
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

