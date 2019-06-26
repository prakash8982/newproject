
# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController

  protected

  def after_resending_confirmation_instructions_path_for(resource_name)
    if signed_in?
      flash[:notice] = "New message here" #this is optional since devise already sets the flash message
      root_path
    else
      new_session_path(resource_name)
    end
  end
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
