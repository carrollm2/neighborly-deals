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
  
  
  post '/requests' do
    if Helpers.is_logged_in?(session)
      if params["category"] == "" || params["description"] == "" || params["type"] == ""
        redirect 'requests/new'
      else
        @user_request = Request.create(category: params["category"], description: params["description"], rtype: params["type"], user_id: session[:user_id])
        erb :'requests/index'
      end
    end
  end  
  
  
end