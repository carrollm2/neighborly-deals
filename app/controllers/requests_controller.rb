class RequestsController < ApplicationController

  get '/requests' do
    if Helpers.is_logged_in?(session)
      erb :'requests/index'
    else
      redirect '/login'
    end
  end
end