require 'rails_helper'



RSpec.describe ProjectUpdatesController, :type => :controller do

  describe "receive_data" do
    before :each do
      create(:user, first_name: "Test Creator", phone: 111)
      create(:project, name: "Test Project")    
    end

    it "should find the user and project based on input" do
      hash = { phone: 111, name: "Test Project", title: "Project Update 1", content: "content for update 1" }
      controller.receive_data(hash)
      update = ProjectUpdate.where(title: "Project Update 1").first
      expect(update.user.first_name).to eq "Test Creator"
      expect(update.project.name).to eq "Test Project"
    end

  end

end
