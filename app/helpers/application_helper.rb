module ApplicationHelper
  def our_user
    current_user ||= User.new
  end
end
