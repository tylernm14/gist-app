
class Gist < ApplicationRecord

  belongs_to :user

  has_many :g_files, :dependent => :destroy
  accepts_nested_attributes_for :g_files, :allow_destroy => true

  has_one :short_url, as: :shortenable, :dependent => :destroy
  accepts_nested_attributes_for :short_url, :allow_destroy => true

  validate :no_same_filenames

  has_many :comments, as: :commentable

  validates :description, presence: true
  validates :user, presence: true

  private

    def no_same_filenames
      filenames = g_files.map(&:filename)
      if filenames.uniq.length != filenames.length
        errors.add(:g_files, "Filenames must be unique")
      end
    end

end