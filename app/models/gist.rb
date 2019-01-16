class Gist < ApplicationRecord
  has_many :g_files

  validates_presence_of :g_files
  validates_presence_of :description
  validates_presence_of :short_name
end