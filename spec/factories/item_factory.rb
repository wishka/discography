FactoryBot.define do
  factory :item do
    artist
    sequence(:title) { |n| "Best musik ever (#{n})" }
    sequence(:description) { |n| "Let ig, let it go(#{n})" }
  end
end
