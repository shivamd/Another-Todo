require 'spec_helper'
module Api
  describe TasksController do
    before :each do
      @user = FactoryGirl.create(:user)
      controller.stub current_user: @user
      controller.stub authenticate_user!: true
    end
    describe "#create" do
      it "should be able to create a new record" do
        post :create, task: {name: "New task"}, format: :json
        response.should be_success
        response.body.should == Task.last.to_json
      end
    end

    describe "#index" do
      it "should be able to view all tasks" do
        task = FactoryGirl.create(:task)
        @user.tasks << task
        get :index
        response.should be_success
        response.body.should == @user.tasks.to_json
      end
    end

    describe "#update" do
      before do
        @task = FactoryGirl.create(:task)
        @user.tasks << @task
      end
      it "should update the task" do
        put :update, id: @task.id, task: {completed: true}, format: :json
        response.should be_success
        @task.reload.completed.should == true
      end
    end

    describe "#destroy" do
      before do
        @task = FactoryGirl.create(:task)
        @user.tasks << @task
      end

      it "should destroy the task" do
        delete :destroy, id: @task.id
        response.should be_success
        @user.tasks.count.should == 0
      end
    end
  end
end
