class RequestTypesController < ApplicationController

  get '/request_types' do
    @request_types = RequestType.all
    erb :'/request_types/index'
  end

  get '/request_types/new' do
    erb :'/request_types/new'
  end

  post '/request_types' do

    if !params["request"]["type"].empty?
      RequestType.find_or_create_by(params["request"]["type"])
    end

    redirect to "/request_types"

  end
end