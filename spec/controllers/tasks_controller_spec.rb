require 'spec_helper'
module Api
  describe TasksController do
    describe "#create" do
      before do
        @user = FactoryGirl.create(:user)
        controller.stub current_user: @user
        controller.stub authenticate_user!: true
      end
      it "should be able to create a new record" do
        post :create, task: {name: "New task"}, format: :json
        response.should be_success
        response.body.should == Task.last.to_json
      end
    end
  end
end
