
class Gist < ApplicationRecord

  include ShortUrl
  belongs_to :user

  has_many :g_files
  accepts_nested_attributes_for :g_files, :allow_destroy => true,
                                                    :reject_if => :all_blank
  has_many :comments, as: :commentable

  validates :user, presence: true
  validates :g_files, presence: true
  validates :description, presence: true
  validates :short_url, presence: true, uniqueness: true
  validates :custom_alias, uniqueness: true

end