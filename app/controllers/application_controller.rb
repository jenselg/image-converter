class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :render_root
  after_action :set_access_control_headers
  
  private

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = "http://allpic.site"
    headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end

  def render_root
    redirect_to root_path
  end
  
end
