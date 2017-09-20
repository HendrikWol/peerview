class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :better_errors_hack, if: -> { Rails.env.development? }

  def better_errors_hack
    request.env['puma.config'].options.user_options.delete :app
  end
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :date_of_birth, :description, :city, :classroom_id, :courses, :id])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
