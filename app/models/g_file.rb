class GFile < ApplicationRecord
  belongs_to :gist
  validates_presence_of :name
  validates_presence_of :contents
end
