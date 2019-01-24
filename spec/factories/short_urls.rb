FactoryBot.define do
  factory :short_url do
    association :shortenable, factory: :gist
  end
end