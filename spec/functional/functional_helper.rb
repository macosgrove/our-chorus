require 'spec_helper'

def should_be_on(path)
  wait_until { page.current_url.match(Regexp.new(path)) }
end

def sign_in_with(username, password)
  visit user_session_path
  fill_in 'Login', with: username
  fill_in 'Password', with: password
  click_button 'Sign in'
end
