class UsersController < ApplicationController
  
  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect '/posts'
    else
      erb :'users/signup'
    end
  end
  
  
  post '/signup' do
    
    if User.all.find_by(email: params[:email]) || User.all.find_by(username: params[:username])
      flash[:signup] = "A user already exists with same username or email."
      redirect '/signup'
    end

    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:signup] = "Username, Email and Password all need to be provided for successful signup."
      redirect '/signup'
    end

    user = User.create(params)
    
    session[:user_id] = user.id
      
    redirect '/posts'

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
	    flash[:login] = "Please check username and password."
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