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
      if params["category"]["name"] == "" || params["description"] == "" || params["request"]["type"] == ""
        redirect 'requests/new'
      else
        @user_request = Request.create(category: params["category"]["name"], description: params["description"], rtype: params["request"]["type"], user_id: session[:user_id])
        erb :'requests/index'
      end
    end
  end  
  
  
  get '/requests/:id' do
    if Helpers.is_logged_in?(session)
      @user_request = Request.find_by(id: params[:id])
      erb :'requests/show'
    else
      redirect '/login'
    end
  end  
  
  
  get '/requests/:id/edit' do
    if Helpers.is_logged_in?(session)
      @user_request = Request.find_by(id: params[:id])
      @user = User.find_by(id: @user_request.user_id)
      if @user.id == session[:user_id] && @user_request.category != "" && @user_request.description != "" && @user_request.rtype != ""
        erb :"requests/edit"
      end
    else
      redirect '/login'
    end
  end  
  
  
  patch '/requests/:id' do
    if Helpers.is_logged_in?(session)
      @user_request = Request.find_by(id: params[:id])
      @user = User.find_by(id: @user_request.user_id)
      if @user.id == session[:user_id] && @user_request.category != "" && @user_request.description != "" && @user_request.rtype != ""
        @user_request.update(category: params["request"]["category"])
        @user_request.update(description: params["request"]["description"])
        @user_request.update(rtype: params["request"]["type"])
        redirect "requests/#{@user_request.id}"
      end
    end
  end
  
  
  delete '/requests/:id' do
    if Helpers.is_logged_in?(session)
      @user_request = Request.find_by(id: params[:id])
      @user = User.find_by(id: @user_request.user_id)
      if @user.id == session[:user_id]
        @user_request.delete
        redirect "/requests"
      end
    else
      redirect '/login'
    end
  end  
  
  
end