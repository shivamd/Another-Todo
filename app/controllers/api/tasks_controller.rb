module Api
  class TasksController < ApplicationController
    before_filter :authenticate_user!

    def create
      task = current_user.tasks.create(task_params)
      render json: task, status: 201
    end

    private

    def task_params
      params.require(:task).permit(:name, :completed, :due_date)
    end
  end
end
