FactoryGirl.define do
  factory :user_task do
    user_id 1
    sequence :title do |n|
      "BIG丼大盛りを完食する#{n}"
    end
    difficulty 1
    steps 1
    failure_at nil
    done_at nil
  end

end
