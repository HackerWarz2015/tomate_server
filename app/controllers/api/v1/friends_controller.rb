class Api::V1::FriendsController < ApiController
  skip_load_and_authorize_resource
  before_filter :check_authorization

  def index
    @friend_ids = User.find(params[:user_id]).friends.map { |friend| friend.id }
  end

  def create
    from_id = params[:user_id]
    to_ids = params[:friend][:friends][:friend_ids]
    ret, e = Friendship.create_friendship(from_id, to_ids)

    if ret
      @friend_ids = User.find(params[:user_id]).friends.map { |friend| friend.id }
    else
      render json: { "error": e }
    end
  end

  private

  def check_authorization
    authorize! :manage, Friendship
  end
end
