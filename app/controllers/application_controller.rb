class ApplicationController < ActionController::Base
  add_flash_types :success, :error
  protect_from_forgery prepend: true
end
