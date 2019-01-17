class Gist < ApplicationRecord
  has_many :g_files
  accepts_nested_attributes_for :g_files, :allow_destroy => true,
                                                    :reject_if => :all_blank

  validates_presence_of :g_files
  validates_presence_of :description
  validates_presence_of :short_url

  validates_uniqueness_of :short_url


  # before validation, make up a short_url if none is given
  # before_create check that ther is no collision of short_url
end