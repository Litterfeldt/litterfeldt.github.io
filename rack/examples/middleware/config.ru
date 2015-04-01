require 'rack'
require 'useragent'

# Discurage unwanted users
class PruneUsers
  def initialize(app)
    @app = app
  end

  def call(env)
    case UserAgent.parse(env['HTTP_USER_AGENT']).browser
    when 'Internet Explorer'
      [404, {}, ['Burn in hell']]
    else
      @app.call(env)
    end
  end
end

use PruneUsers
run ->(_) { [200, {}, ['Oh hi, Welcome!']] }
