FactoryGirl.define do
  factory :reward do
    sequence :title do |n|
      "title#{n}"
    end
    required_steps 3
    is_public false
    released_at nil
    done_at nil
  end

end
