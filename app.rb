require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'
require './database_connection_setup'
# Require - four listed, I might need to add more to get functionality later after rspec test.

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end

get '/' do
  redirect '/chitter'
end

get '/chitter' do
  @peeps = Peeps.all
  erb :'/chitter'
end


post '/chitter' do
  Peeps.create(message: params[:message])
  redirect '/chitter'
end

  run! if app_file == $0
end
