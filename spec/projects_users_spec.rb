require 'rails_helper'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

describe "projects and users relationships" do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @project1 = create(:project)
    @project2 = create(:project)
  end

  it "should be able to handle a user with no project" do
    expect(@user1.projects.count).to eq 0
  end

  it "should handle a user with a project" do
    @user1.projects << @project1
    expect(@user1.projects.count).to eq 1
  end

  it "should recognise the project has a user" do
    @user1.projects << @project1
    expect(@project1.users.count).to eq 1
  end

  it "should be able to allow a user to have multiple projects" do
    @user1.projects << @project1
    @user1.projects << @project2
    expect(@user1.projects.count).to eq 2
  end

  it "should allow projects to have multiple users" do
    @project1.users << @user1
    @project1.users << @user2
    expect(@project1.users.count).to eq 2
  end
end
    