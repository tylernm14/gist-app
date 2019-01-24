FactoryBot.define do
  factory :g_file do
    filename { "#{Faker::Lorem.unique.word}.txt" }
    contents { 'contents...' }
    gist
  end
end