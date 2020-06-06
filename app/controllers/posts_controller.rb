class PostsController < ApplicationController

  get '/posts' do
    if Helpers.is_logged_in?(session)
      @username = User.find_by(id: session[:user_id]).username      
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
      if params["category"]["id"] == "" || params["description"] == "" || params["post_type"]["id"] == ""
        redirect 'posts/new'
      else
        @username = User.find_by(id: session[:user_id]).username
        @post = Post.create(category_id: params["category"]["id"], description: params["description"], post_type_id: params["post_type"]["id"], user_id: session[:user_id])
        
        flash[:message] = "Successfully created post."
        redirect to "/posts/#{@post.id}"
      end
    end
  end  
  
  
  get '/posts/:id' do
    if Helpers.is_logged_in?(session)
      @post = Post.find_by(id: params[:id])
      erb :'posts/show'
    else
      redirect '/login'
    end
  end  
  
  
  get '/posts/:id/edit' do
    if Helpers.is_logged_in?(session)
      @post = Post.find_by(id: params[:id])
      @user = User.find_by(id: @post.user_id)
      if @user.id == session[:user_id] && @post.category_id != "" && @post.description != "" && @post.post_type_id != ""
        erb :"posts/edit"
      else
        flash[:message] = "Not authorized to edit post of other users."
        redirect '/posts'
      end
    else
      redirect '/login'
    end
  end  
  
  
  patch '/posts/:id' do
    if Helpers.is_logged_in?(session)
      @post = Post.find_by(id: params[:id])
      @user = User.find_by(id: @post.user_id)
      if @user.id == session[:user_id] && @post.category_id != "" && @post.description != "" && @post.post_type_id != ""
        @post.update(category_id: params["post"]["category_id"])
        @post.update(description: params["post"]["description"])
        @post.update(post_type_id: params["post_type"]["id"])
        
        flash[:message] = "Successfully updated post."
        
        redirect "posts/#{@post.id}"
      end
    end
  end
  
  
  delete '/posts/:id' do
    if Helpers.is_logged_in?(session)
      @post = Post.find_by(id: params[:id])
      @user = User.find_by(id: @post.user_id)
      if @user.id == session[:user_id]
        @post.delete
        redirect "/posts"
      end
    else
      redirect '/login'
    end
  end  
end