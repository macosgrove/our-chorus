class RegistrationsController < Devise::RegistrationsController

  def welcome
    set_welcome_message
    set_details_message
  end

  protected

  def set_welcome_message
    @message = 'Thanks for signing up. We\'re glad to have you on board!'
  end

  def set_details_message
    @details = 'Our founder, Mary-Anne, will be in touch with you soon.' if current_user.has_role? :prospective
  end

  def after_sign_up_path_for(resource)
    welcome_path
  end

end