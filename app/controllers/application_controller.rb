class ApplicationController < ActionController::Base
  helper_method :current_user

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def reject_user
    redirect_to root_path, alert: 'Вам сюда низя!'
  end

  def not_found
    redirect_to root_path, alert: 'Запись не найдена!'
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
