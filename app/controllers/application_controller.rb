class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :is_current_user?
  def is_current_user?
    if current_user
      @user = current_user
    end
  end
end
