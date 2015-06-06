class Api::V1::UsersController < ApiController
  def index
    @users = {
      users: [
        {
          id: 1,
          name: "ks",
          email: "ks@ks.com",
          steps: 10000,
          friend_ids: [
            1, 2, 3
          ]
        }
      ]
    }
    render json: @users
  end
end
