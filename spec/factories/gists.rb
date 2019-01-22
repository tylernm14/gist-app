FactoryBot.define do
  factory :gist do
    user
    description { 'Fun gist!'}
    # association :short_url, factory: :short_url, strategy: :build
    after(:create) do |g|
      create_list :g_file, 3, gist: g
      create :short_url, shortenable: g
    end
  end
end