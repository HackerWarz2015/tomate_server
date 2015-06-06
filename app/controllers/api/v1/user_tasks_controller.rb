class Api::V1::UserTasksController < ApiController
  def index
    @user_tasks = {
      "user_tasks": [
       {
          "id": 1,
          "title": "神になる",
          "difficulty": 5,
          "steps": 5,
          "failure_at": nil,
          "done_at": "2015-03-20T16:28:43.000+09:00",
          "created_at": "2015-03-20T16:28:43.000+09:00",
          "updated_at": "2015-03-20T16:28:43.000+09:00"
       }
      ]
    }
    render json: @user_tasks
  end

  def create
  end

  def update
  end

end
