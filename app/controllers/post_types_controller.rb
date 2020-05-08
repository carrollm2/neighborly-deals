class PostTypesController < ApplicationController

  get '/post_types' do
    erb :'/post_types/index'
  end

  get '/post_types/new' do
    erb :'/post_types/new'
  end

  post '/post_types' do

    if !params["post"]["type"].empty?
      PostType.find_or_create_by(params["post"]["type"])
    end

    redirect to "/post_types"

  end
end