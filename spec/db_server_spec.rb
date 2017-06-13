require 'spec_helper'
require 'rack/test'
require 'db_server'

describe 'db server' do
  include Rack::Test::Methods

  def app
    DBServerApp
  end

  it 'responds to get with no params entered' do
    get '/'
    expect(last_response.body).to include('Somekey = ')
  end

  it 'response is ok' do
    get '/'
    expect(last_response.status).to eq(200)
  end

  it 'responds with post details' do
    post '/set?somekey=somevalue'
    expect(last_response.body).to include('somevalue')
  end

  it 'visit /get?key=somekey returns the params passed in the post request' do
    post '/set?somekey=somevalue'
    get '/get?key=somekey'
    expect(last_response.body).to include('somevalue')
  end
end
