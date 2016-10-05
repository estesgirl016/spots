class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :is_current_user?
  def is_current_user?
    if current_user
      @current_user = current_user
    else
      @current_user = false 
    end
  end
end
