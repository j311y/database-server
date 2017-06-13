require 'rack'
require 'rack/server'

class DBServerApp

  def self.call(env)
    request = Rack::Request.new(env)
    somekey = request.params['somekey'] || 'no params entered'

    response = Rack::Response.new
    response.set_cookie('cookie', somekey: 'somekey', domain: false, path: '/set?somekey=')
    response.body = ["Somekey = #{somekey}"]
    response.finish
  end

end
