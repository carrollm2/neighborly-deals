require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    
    register Sinatra::ActiveRecordExtension
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "password_security"    
    
  end

  get "/" do
    erb :welcome
  end

end
