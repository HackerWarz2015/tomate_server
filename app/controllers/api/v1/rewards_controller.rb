class Api::V1::RewardsController < ApiController
  skip_load_and_authorize_resource
  before_filter :check_authorization

  def index
    @rewards = Reward.where(user_id: params[:user_id])
  end

  def create
    ActiveRecord::Base.transaction do
      @reward = Reward.new(reward_params)
      @reward.save
      UsersReward.create(user_id: params[:user_id], reward_id: @reward.id)
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
    params.require(:reward).permit(:title, :is_public)
  end
end
