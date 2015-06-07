class Api::V1::RewardsController < ApiController
  skip_load_and_authorize_resource
  before_filter :check_authorization

  def index
    @rewards = []
    users_rewards = UsersReward.where(user_id: params[:user_id])
    users_rewards.each do |ur|
      reward = Reward.find(ur.reward_id)
      @rewards << {
        id: reward.id,
        title: reward.title,
        required_steps: reward.required_steps,
        absolute_steps: ur.absolute_steps,
        is_public: reward.is_public,
        released_at: reward.released_at,
        done_at: reward.done_at,
      }
    end
  end

  def create
    ActiveRecord::Base.transaction do
      @reward = Reward.new(reward_params)
      @reward.save

      @user = User.find(params[:user_id])
      absolute_steps = @user.steps + @reward.required_steps
      UsersReward.create(user_id: params[:user_id], reward_id: @reward.id, absolute_steps: absolute_steps)
    end
    rescue => e
      render json: { "error": "failed to create reward to database" }
  end

  def update
    @reward = Reward.find(params[:id])
    update_params = reward_params
    if params[:status] == "release"
      update_params[:release_at] = DateTime.now
    elsif params[:status] == "done"
      update_params[:done_at] = DateTime.now
    end
    unless @reward.update_attributes(update_params)
      render json: { "error": "failed to update changes to database" }
    end
  end

  private

  def check_authorization
    authorize! :manage, Reward
    authorize! :manage, UsersReward
  end

  def reward_params
    params.require(:reward).permit(:title, :is_public, :required_steps)
  end
end
