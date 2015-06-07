class Api::V1::UserTasksController < ApiController
  def index
    @user_tasks = UserTask.where(user_id: params[:user_id])
  end

  def create
    @user_task = UserTask.new(user_task_params)
    @user_task.user_id = params[:user_id]
    unless @user_task.save
      render json: { "error": "failed to create UserTask to database" }
    end
  end

  def update
    @user_task = UserTask.find(params[:id])

    update_params = user_task_params
    if params[:status] == "failure"
      new_step = @user_task.user.steps - @user_task.steps
      @user_task.user.update_attributes(steps: new_step)
      update_params[:steps] = 0
      update_params[:failure_at] = DateTime.now
    elsif params[:status] == "done"
      if @user_task.failure_at.nil?
        new_step = @user_task.user.steps + @user_task.steps * 2
        @user_task.user.update_attributes(steps: new_step)
        update_params[:steps] *= 2
      end
      update_params[:done_at] = DateTime.now
    end

    unless @user_task.update_attributes(update_params)
      render json: { "error": "failed to update changes to database" }
    end
  end

  private

  def user_task_params
    params.require(:user_task).permit(:title, :difficulty, :steps, :user_id, :limit_at)
  end
end
