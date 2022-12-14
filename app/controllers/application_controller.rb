class ApplicationController < ActionController::Base
  #もしログインしていなければTOPへ
  before_action :authenticate_user!, except: [:top,:about]
  
  # middleware - before
  before_action :configure_permitted_parameters, if: :devise_controller?

  #private

  def after_sign_in_path_for(resource)
    books_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  #この中でしか参照できない
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
  end
end
