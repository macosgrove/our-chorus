require 'spec_helper'

def should_be_on(path)
  wait_until { page.current_url.match(Regexp.new(path)) }
end
