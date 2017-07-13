FactoryGirl.define do
  factory :reservation do
    association :car, factory: :car
    association :user, factory: :user
    start_date 2.seconds.ago
    end_date 1.second.ago
  end
end
