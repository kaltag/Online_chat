class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_current_user)
    root_path
  end

  def default_url_options
    { locale: I18n.locale }
  end

  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale] = I18n.locale
  end
end
