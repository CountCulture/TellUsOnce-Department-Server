# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  private
  def authenticate
    authenticate_or_request_with_http_basic("tuo_demo") do |username, password|
      ((ENV['AUTH_USER'] == username) && (ENV['AUTH_PWD'] == password)) || (AUTHENTICATED_USERS[username] == password) # get heroku password or use local one
    end
  end
end
