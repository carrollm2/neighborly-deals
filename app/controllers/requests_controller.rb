class RequestsController < ApplicationController

  get '/requests' do
    if Helpers.is_logged_in?(session)
      erb :'requests/index'
    else
      redirect '/login'
    end
  end
  
  
  get '/requests/new' do
    if Helpers.is_logged_in?(session)
      erb :'requests/new'
    else
      redirect '/login'
    end
  end  
  
  
end