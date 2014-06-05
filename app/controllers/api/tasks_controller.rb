module Api
  class TasksController < ApplicationController
    before_action :authenticate_user!

    def index
      render json: current_user.tasks
    end

    def create
      task = current_user.tasks.create(task_params)
      render json: task, status: 201
    end

    def update
      task.update_attributes(task_params)
      render json: task, status: 204
    end

    private

    def task
      @task ||= current_user.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :completed, :due_date)
    end
  end
end
