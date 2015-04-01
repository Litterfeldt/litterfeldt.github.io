require 'rack'
require 'useragent'

prune_users = lambda do |env|
  case browser = UserAgent.parse(env['HTTP_USER_AGENT']).browser
  when 'Internet Explorer'
    [404, {}, ['Burn in hell']]
  else
    # Display website or something
    [200, {}, ["Oh good, you're using #{browser}"]]
  end
end

run prune_users
