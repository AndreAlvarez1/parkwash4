class ApplicationController < ActionController::Base

  # check_authorization


  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, alert: exception.message }
    end
  end

  def current_ability
    @current_ability ||= current_washer ? Ability.new(current_washer) : Ability.new(current_user)
  end

end
