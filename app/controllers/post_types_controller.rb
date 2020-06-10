class PostTypesController < ApplicationController

  get '/post_types' do
    if Helpers.is_admin_logged_in?(session)
      erb :'post_types/index'
    else
      redirect '/posts'
    end
  end

  get '/post_types/new' do
    if Helpers.is_admin_logged_in?(session)
      erb :'post_types/new'
    else
      redirect '/post_types'
    end
  end

  post '/post_types' do
  
    if Helpers.is_logged_in?(session)
      if !params["post_type"]["description"].empty?
        PostType.find_or_create_by(description: params["post_type"]["description"])
        erb :'post_types/index'
      else
        erb :'post_types/new'
      end
    else
      redirect '/posts'
    end
  end
end