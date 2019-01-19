require 'digest'
require 'base64'

module ShortUrl
  extend ActiveSupport::Concern

  included do
    before_validation -> { generate_unique_short_url }
  end

  def generate_unique_short_url
    found_dup = true
    uniq_str = ''
    while found_dup
      uniq_str = "#{Time.now.to_i}#{self.description}#{self.user_id}"
      uniq_str = Base64.urlsafe_encode64( [Digest::MD5.hexdigest(uniq_str)].pack('H*') )[0..5]
      res = Gist.find_by_short_url(uniq_str)
      found_dup = false if res.nil?
    end
    self.short_url = uniq_str
  end

end