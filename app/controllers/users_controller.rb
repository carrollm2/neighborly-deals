class UsersController < ApplicationController
  
  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect '/posts'
    else
      erb :'users/signup'
    end
    
  end
  
  
  post '/signup' do

    if params[:username] == "" or params[:email] == "" or params[:password] == ""
      redirect '/signup'
    end

    user = User.create(params)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/posts'
	  end
  end


  get '/login' do
    if Helpers.is_logged_in?(session)
      redirect '/posts'
    else
      erb :'/users/login'
    end

  end


  post '/login' do

    user = User.find_by(:username => params[:username])

	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect '/posts'
	  else
	    redirect '/login'
	  end
  end  
  
  
  get '/logout' do
    if Helpers.is_logged_in?(session)
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end  
  
end