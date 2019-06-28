class ApplicationController < ActionController::Base
private

  #protect_from_forgery with: :exception
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
  	home_index_path
  end

   def after_update_path_for(resource)
      new_user_session_path
    end

end

