get '/locations/:id' do
  @saved_location = SavedLocation.find(params[:id])

  erb :'/locations/show'
end