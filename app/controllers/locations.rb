get '/locations/:id' do
  @saved_location = SavedLocation.find(params[:id])

  erb :'/locations/show'
end

post '/locations' do

  if request.xhr?
    
  else
    
  end


end


#https://api.breezometer.com/baqi/?location=5th+avenue+new+york+ny+united+states&key=YOUR_API_KEY

