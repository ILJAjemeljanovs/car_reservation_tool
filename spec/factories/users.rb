FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "UserName_#{n}"}
  end
end
