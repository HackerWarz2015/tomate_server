class Api::V1::FriendsController < ApiController
  def index
    @friends = {
      friends: {
        friend_ids: [2, 3, 4]
      }
    }
    render json: @friends
  end
end
