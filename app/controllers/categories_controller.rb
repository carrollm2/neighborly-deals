class CategoriesController < ApplicationController

  get '/categories' do
    @categories = Category.all
    erb :'/categories/index'
  end

  get '/categories/new' do
    erb :'/categories/new'
  end

  post '/categories' do

    if !params["category"]["name"].empty?
      Category.find_or_create_by(params["category"]["name"])
    end

    redirect to "/categories"

  end
end