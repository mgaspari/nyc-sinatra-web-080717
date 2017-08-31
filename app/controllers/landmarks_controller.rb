class LandmarksController < ApplicationController

  get '/landmarks/new' do
    #Route to form to create new landmark_id
    erb :'landmarks/new'
  end

  post '/landmarks' do
    #route to create new landmark
    Landmark.create(params[:landmark])
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    #route to show all landmarks
    erb :'landmarks/index'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    #route to get form to edit landmark
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.update(params[:landmark])
    #route to edit landmark
    redirect "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    # binding.pry
    #route to show individual landmark
    erb :'landmarks/show'
  end


end
