class Api::V1::UsersController < ApiController
  def show
    @users = {
      user: {
        id: 1,
        name: "ks",
        email: "ks@ks.com",
        steps: 10000,
        friend_ids: [
          2, 3, 4
        ]
      }
    }
    render json: @users
  end
end
