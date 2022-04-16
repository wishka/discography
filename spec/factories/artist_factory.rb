FactoryBot.define do
  factory :artist do
    sequence(:first_name) { |n| "John (#{n})" }
    sequence(:last_name) { |n| "Smith (#{n})" }
    sequence(:email) { "john.smith@example.com" }
  end
end
