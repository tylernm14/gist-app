class Gist < ApplicationRecord
  has_many :g_files
  accepts_nested_attributes_for :g_files, :allow_destroy => true,
                                                    :reject_if => :all_blank

  validates_presence_of :g_files
  validates_presence_of :description
  validates_presence_of :short_name
end