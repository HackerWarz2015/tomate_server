FactoryGirl.define do
  factory :user_task do
    user_id 1
    title "BIG丼大盛りを完食する"
    difficulty 1
    steps 1
    failure_at nil
    done_at nil
  end

end
