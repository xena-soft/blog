class ApplicationController < ActionController::Base
  ActionController::Base.send :include, ActionController::StrongParameters
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
end
