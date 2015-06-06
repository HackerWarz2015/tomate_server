class Api::V1::UserTasksController < ApiController
  def index
    render json: { controller: UserTask.all }
  end

  def create
  end

  def update
  end

end
