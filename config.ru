require './lib/db_server'

Rack::Handler.default.run(DBServerApp, :Port => 4000)
