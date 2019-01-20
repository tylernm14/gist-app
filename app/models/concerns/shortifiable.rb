require 'digest'
require 'base64'

module Shortifiable
  extend ActiveSupport::Concern

  included do
    before_validation -> { sanitize_or_generate_short_url }
  end

  SHORT_URL_LENGTH = 6

  # Useful if you generate urls for logged in user's after gist details are known
  def generate_unique_short_url
    uniq_str = "#{Time.now.to_i}#{self.description}#{self.user_id}"
    short_url = Base64.urlsafe_encode64( [Digest::MD5.hexdigest(uniq_str)].pack('H*') )[0..(SHORT_URL_LENGTH-1)]
    existing_url_gist = Gist.find_by_short_url(short_url)
    if existing_url_gist.present?
      self.generate_unique_short_url
    else
      self.value = short_url
    end
  end


  # Useful if you want generate the url before user enters anything
  def generate_random_short_url
    short_url = ([*('a'..'z'), *('A'..'Z'), *('0'..'9'), '-', '_']).sample(SHORT_URL_LENGTH).join
    existing_url_gist = ShortUrl.where(value: short_url).last
    if existing_url_gist.present?
      self.generate_random_short_url
    else
      self.value = short_url
    end

  end

  def sanitize_or_generate_short_url
    if self.value.blank?
      generate_random_short_url
    else
      sanitize_short_url
    end
  end

  def sanitize_short_url
    sanitized_url = self.value.strip.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
    self.value = sanitized_url
  end

end