class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!


  layout :choose_layout





  protected

  def choose_layout
    return 'session' unless signed_in?
  end

end
