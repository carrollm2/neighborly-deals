class UsersController < ApplicationController
  
  get '/signup' do

    if Helpers.is_logged_in?(session)
      redirect '/welcome'
    else
      erb :'users/signup'
    end
    
  end
  
  
end