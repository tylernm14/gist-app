FactoryBot.define do
  factory :gist do
    user
    description { 'Fun gist!'}

    factory :gist_with_g_files do
      transient do
        g_files_count { 2 }
      end
      after(:create) do |gist, evaluator|
        create_list(:g_file, evaluator.g_files_count, gist: gist)
        create :short_url, shortenable: gist
        gist.reload
      end
    end
  end
end