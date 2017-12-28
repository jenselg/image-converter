class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :render_root
  
  private

  def render_root
    redirect_to root_path
  end
  
end
