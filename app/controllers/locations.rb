get '/locations/:id' do
  @saved_location = SavedLocation.find(params[:id])

  long = @saved_location.location.longitude.to_s
  lat = @saved_location.location.latitude.to_s
  url = "https://api.breezometer.com/baqi/?lat=" + lat + "&lon=" + long + "&key=56f593e1971d4690b3b16b3523f9c7b4"
  # p url

  # @response = HTTParty.get(url)

  erb :'/locations/show'
end
