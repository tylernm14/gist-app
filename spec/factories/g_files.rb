FactoryBot.define do
  factory :g_file do
    filename { 'test.txt' }
    contents { 'contents...' }
  end
end