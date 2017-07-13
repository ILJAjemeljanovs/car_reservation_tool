FactoryGirl.define do
  factory :car do
    sequence(:number) {|n| "CAR#{n}"}
  end
end
