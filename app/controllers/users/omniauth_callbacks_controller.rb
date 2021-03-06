# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end


    def facebook
      # Debemos crear el método .from_omniauth en nuestro modelo User (app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])
      @user.place_id = 1
      @full_name = @user.first_name.split(" ")
      @user.first_name = @full_name[0]
      @user.last_name = @full_name[1]
      @user.gender = "male"
      @user.save

      if @user.persisted?
        sign_in_and_redirect @user
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        redirect_to root_path, notice: 'Error al iniciar sesión con Facebook.'
      end

    end

end


  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
