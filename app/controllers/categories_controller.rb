class CategoriesController < ApplicationController

  get '/categories' do
    
    if Helpers.is_admin_logged_in?(session)
      erb :'/categories/index'
    else
      redirect '/posts'
    end 
    
  end


  get '/categories/new' do
    
    if Helpers.is_admin_logged_in?(session)
      erb :'categories/new'
    else
      redirect '/categories'
    end    
    
  end


  post '/categories' do

    if Helpers.is_logged_in?(session)
      if !params["category"]["name"].empty?
        Category.find_or_create_by(name: params["category"]["name"])
        erb :'categories/index'
      else
        erb :'categories/new'
      end
    else
      redirect '/posts'
    end
    
  end
  
end