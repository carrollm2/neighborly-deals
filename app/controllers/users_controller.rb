class UsersController < ApplicationController
  
  get '/signup' do

    if Helpers.is_logged_in?(session)
      redirect '/welcome'
    else
      erb :'users/signup'
    end
    
  end
  
  
  post '/signup' do

    if params[:username] == "" or params[:email] == "" or params[:password] == ""
      redirect 'users/signup'
    end

    user = User.create(params)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/welcome"
	  end
  end


  get '/login' do
    if Helpers.is_logged_in?(session)
      redirect '/welcome'
    else
      erb :'/users/login'
    end

  end


  post '/login' do

    user = User.find_by(:username => params[:username])

	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect '/welcome'
	  else
	    redirect '/users/login'
	  end
  end  
  
  
  
  
end