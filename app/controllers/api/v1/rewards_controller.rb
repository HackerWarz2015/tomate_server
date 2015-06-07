class Api::V1::RewardsController < ApiController
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
      render json: { "error": "ks #{e}" }
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
      render json: { "error": "ks" }
    end
  end

  private

  def reward_params
    params.require(:reward).permit(:title, :is_public)
  end
end
