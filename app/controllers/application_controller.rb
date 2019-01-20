class ApplicationController < ActionController::Base
  add_flash_types :success, :error
  protect_from_forgery prepend: true

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end
