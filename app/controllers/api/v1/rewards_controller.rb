class Api::V1::RewardsController < ApiController
  def index
    @rewards = {
      rewards: [
        "id": 1,
        "title": "たけしと一緒に宇宙に行く",
        "is_public": true,
        "released_at": "2015-03-20T16:28:43.000+09:00",
        "done_at": "2015-03-20T16:28:43.000+09:00",
        "created_at": "2015-03-20T16:28:43.000+09:00",
        "updated_at": "2015-03-20T16:28:43.000+09:00"
      ]
    }
    render json: @rewards
  end

  def create
  end

  def update
  end
end
