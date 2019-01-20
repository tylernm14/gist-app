class ShortUrl < ApplicationRecord

  include Shortifiable

  MIN_CUSTOM_URL_LENGTH = 1
  MAX_CUSTOM_URL_LENGTH = 16

  belongs_to :shortenable, polymorphic: true

  validates :shortenable, presence: true
  validates :value, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9\-_]+\Z/},
            length: { minimum: MIN_CUSTOM_URL_LENGTH, maximum: MAX_CUSTOM_URL_LENGTH, allow_blank: false}
end