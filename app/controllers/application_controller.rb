class ApplicationController < ActionController::Base
  protect_from_forgery

  helper Citygate::Engine.helpers
end
