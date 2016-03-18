get '/locations/:id' do
  @saved_location = SavedLocation.find(params[:id])
  long = @saved_location.location.longitude.to_s
  lat = @saved_location.location.latitude.to_s
  url = "http://api.breezometer.com/baqi/?lat=" + lat + "&lon=" + long + "&key=56f593e1971d4690b3b16b3523f9c7b4"

  # HTTParty::Basement.default_options.update(verify: false) # Use this if http request include ssl
  @api_response = HTTParty.get(url)
  p @api_response
  erb :'/locations/show'
end

get '/locations/new' do

end

post '/locations' do
  new_location = Location.find_or_create_by(params[:loc])

  saved_location = SavedLocation.new(params[:new_saved_location])
  saved_location.location = new_location
  saved_location.user = current_user
  if saved_location.save
    redirect '/users'
  end
end

delete '/locations/:id' do
  location = SavedLocation.find(params[:id])
  location.destroy
  redirect '/users'
end
