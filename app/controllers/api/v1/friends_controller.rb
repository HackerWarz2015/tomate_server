class Api::V1::FriendsController < ApiController
  def index
    @friend_ids = User.find(params[:user_id]).friends.map { |friend| friend.id }
  end
end
