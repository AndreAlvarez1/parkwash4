# frozen_string_literal: true

class Washers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    debugger
    super
    redirect_to pages_index_washers_path
  end

  # POST /resource/sign_in
  def create
    debugger
    super
    redirect_to pages_index_washers_path

  end

  # DELETE /resource/sign_out
  def destroy
    debugger
    super
    redirect_to pages_index_washers_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
