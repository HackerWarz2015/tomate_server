class Api::V1::UserTasksController < ApiController
  def index
    render json: { controller: "UserTasks#index" }
  end
end
