class GFile < ApplicationRecord
  belongs_to :gist

  validates :gist, presence: true
  validates :filename, presence: true
  validates :contents, presence: true
end
