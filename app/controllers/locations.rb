get '/locations/:id' do
  @saved_location = SavedLocation.find(params[:id])
  long = @saved_location.location.longitude.to_s
  lat = @saved_location.location.latitude.to_s
  url = "http://api.breezometer.com/baqi/?lat=" + lat + "&lon=" + long + "&key=56f593e1971d4690b3b16b3523f9c7b4"

  # months = [1,2,3,4,5,6,7,8,9,10,11,12]
  # historic_urls = []

  # months.each do |month|
  #   historic_urls << "http://api.breezometer.com/baqi/?datetime=" + year.to_s + "-01-01T12:00:00&lat=" + lat + "&lon=" + long + "&fields=breezometer_aqi,breezometer_color&key=56f593e1971d4690b3b16b3523f9c7b4"
  # end


  url_array = ["http://api.breezometer.com/baqi/?datetime=2016-03-01T12:00:00&lat=" + lat + "&lon=" + long + "&fields=breezometer_aqi,breezometer_color&key=56f593e1971d4690b3b16b3523f9c7b4",
  "http://api.breezometer.com/baqi/?datetime=2016-02-01T12:00:00&lat=" + lat + "&lon=" + long + "&fields=breezometer_aqi,breezometer_color&key=56f593e1971d4690b3b16b3523f9c7b4",
  "http://api.breezometer.com/baqi/?datetime=2016-01-01T12:00:00&lat=" + lat + "&lon=" + long + "&fields=breezometer_aqi,breezometer_color&key=56f593e1971d4690b3b16b3523f9c7b4",
  "http://api.breezometer.com/baqi/?datetime=2015-12-01T12:00:00&lat=" + lat + "&lon=" + long + "&fields=breezometer_aqi,breezometer_color&key=56f593e1971d4690b3b16b3523f9c7b4",
  "http://api.breezometer.com/baqi/?datetime=2015-11-01T12:00:00&lat=" + lat + "&lon=" + long + "&fields=breezometer_aqi,breezometer_color&key=56f593e1971d4690b3b16b3523f9c7b4",
  "http://api.breezometer.com/baqi/?datetime=2015-10-01T12:00:00&lat=" + lat + "&lon=" + long + "&fields=breezometer_aqi,breezometer_color&key=56f593e1971d4690b3b16b3523f9c7b4",
  "http://api.breezometer.com/baqi/?datetime=2015-09-01T12:00:00&lat=" + lat + "&lon=" + long + "&fields=breezometer_aqi,breezometer_color&key=56f593e1971d4690b3b16b3523f9c7b4",
  "http://api.breezometer.com/baqi/?datetime=2015-08-01T12:00:00&lat=" + lat + "&lon=" + long + "&fields=breezometer_aqi,breezometer_color&key=56f593e1971d4690b3b16b3523f9c7b4"]

  @historic_data = []
  url_array.each do |url|
    full_response =  HTTParty.get(url)
    @historic_data << [full_response.parsed_response["breezometer_aqi"], full_response.parsed_response["breezometer_color"]]
  end

  @historic_data.reverse!

  # HTTParty::Basement.default_options.update(verify: false) # Use this if http request include ssl
  api_response = HTTParty.get(url)

  # Create hash using desired api data
  @aq_data = Hash.new
  @aq_data["aqi"] = api_response.parsed_response["breezometer_aqi"]
  @aq_data["aqi_color"] = api_response.parsed_response["breezometer_color"]
  @aq_data["aqi_description"] = api_response.parsed_response["breezometer_description"]
  @aq_data["dom_poll"] = api_response.parsed_response["dominant_pollutant_canonical_name"]

  @aq_data_json = @aq_data.to_json



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
