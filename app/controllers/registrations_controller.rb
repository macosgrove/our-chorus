class RegistrationsController < Devise::RegistrationsController

  def welcome
    set_welcome_message
    set_details_message
  end

  protected

  def set_welcome_message
    @message = 'You have successfully registered to'
    @message = @message + ' join our chorus' if current_user.has_role? :prospective
    @message = @message + ' and' if (current_user.has_role? :prospective) && (current_user.has_role? :course_attendee)
    @message = @message + ' attend our course' if current_user.has_role? :course_attendee
    @message = @message + '.'
  end

  def set_details_message
    @details = 'The course runs every Wednesday from 7:30pm starting July 17' if current_user.has_role? :course_attendee
    @details = 'Rehearsals are every Wednesday from 7:30pm starting July 10' if current_user.has_role? :prospective
  end

  def after_sign_up_path_for(resource)
    welcome_path
  end

end