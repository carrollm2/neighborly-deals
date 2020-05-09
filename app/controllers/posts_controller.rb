class PostsController < ApplicationController

  get '/posts' do
    if Helpers.is_logged_in?(session)
      @user_name = User.find_by(id: session[:user_id]).username      
      erb :'posts/index'
    else
      redirect '/login'
    end
  end
  
  
  get '/posts/new' do
    if Helpers.is_logged_in?(session)
      erb :'posts/new'
    else
      redirect '/login'
    end
  end  
  
  
  post '/posts' do
    if Helpers.is_logged_in?(session)
      if params["category"]["id"] == "" || params["description"] == "" || params["post"]["type"] == ""
        redirect 'posts/new'
      else
        @user_name = User.find_by(id: session[:user_id]).username
        @user_post = Post.create(category_id: params["category"]["id"], description: params["description"], rtype: params["post"]["type"], user_id: session[:user_id])
        
        flash[:message] = "Successfully created post."
        redirect to "/posts/#{@user_post.id}"
      end
    end
  end  
  
  
  get '/posts/:id' do
    if Helpers.is_logged_in?(session)
      @user_post = Post.find_by(id: params[:id])
      erb :'posts/show'
    else
      redirect '/login'
    end
  end  
  
  
  get '/posts/:id/edit' do
    if Helpers.is_logged_in?(session)
      @user_post = Post.find_by(id: params[:id])
      @user = User.find_by(id: @user_post.user_id)
      if @user.id == session[:user_id] && @user_post.category_id != "" && @user_post.description != "" && @user_post.rtype != ""
        erb :"posts/edit"
      end
    else
      redirect '/login'
    end
  end  
  
  
  patch '/posts/:id' do
    if Helpers.is_logged_in?(session)
      @user_post = Post.find_by(id: params[:id])
      @user = User.find_by(id: @user_post.user_id)
      if @user.id == session[:user_id] && @user_post.category_id != "" && @user_post.description != "" && @user_post.rtype != ""
        @user_post.update(category_id: params["post"]["category_id"])
        @user_post.update(description: params["post"]["description"])
        @user_post.update(rtype: params["post"]["type"])
        
        flash[:message] = "Successfully updated post."
        
        redirect "posts/#{@user_post.id}"
      end
    end
  end
  
  
  delete '/posts/:id' do
    if Helpers.is_logged_in?(session)
      @user_post = Post.find_by(id: params[:id])
      @user = User.find_by(id: @user_post.user_id)
      if @user.id == session[:user_id]
        @user_post.delete
        redirect "/posts"
      end
    else
      redirect '/login'
    end
  end  
end