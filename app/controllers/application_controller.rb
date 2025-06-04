class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protect_from_forgery with: :exception

  # Redirect to notes after sign in
  def after_sign_in_path_for(resource)
    notes_path
  end
end
