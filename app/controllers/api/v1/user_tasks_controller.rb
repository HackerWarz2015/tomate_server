class Api::V1::UserTasksController < ApiController
  def index
    @user_tasks = User.find(params[:user_id]).user_tasks
  end

  def create
    @user_task = UserTask.new(user_task_params)
    @user_task.user_id = params[:user_id]
    unless @user_task.save
      render json: { "error": "ks" }
    end
  end

  def update
    @user_task = UserTask.find(params[:id])

    update_params = user_task_params
    if params[:status] == "failure"
      update_params[:failure_at] = DateTime.now
    elsif params[:status] == "done"
      update_params[:done_at] = DateTime.now
    end

    unless @user_task.update_attributes(update_params)
      render json: { "error": "ks" }
    end
  end

  private

  def user_task_params
    params.require(:user_task).permit(:title, :difficulty, :steps, :user_id)
  end
end
