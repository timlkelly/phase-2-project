tim   = User.create!({first_name: "tim", last_name: "kelly", email: "timlkelly@gmail.com", password: "password"})
lydia = User.create!({first_name: "lydia", last_name: "nash", email: "lydiamnash@gmail.com", password: "password"})

chicago  = Location.create!({latitude: 41.8369,  longitude: -87.6847})
berkeley = Location.create!({latitude: 37.8717,  longitude: -122.2728})
oakland  = Location.create!({latitude: 37.8044,  longitude: -122.2708})
london   = Location.create!({latitude: 51.5072,  longitude: -0.1275})
evanston = Location.create!({latitude: 42.0464,  longitude: -87.6947})

assocation  = SavedLocation.create!({ location_id: 1, user_id: 1, name: "Home" })
assocation1 = SavedLocation.create!({ location_id: 4, user_id: 1, name: "Study Abroad" })
assocation2 = SavedLocation.create!({ location_id: 2, user_id: 2, name: "Home" })
assocation3 = SavedLocation.create!({ location_id: 3, user_id: 2, name: "Second Home" })

https://api.breezometer.com/baqi/?start_datetime=2016-03-04T16:00:00&end_datetime=2016-03-18T16:00:00&lat=41.8369&lon=-87.6847&key=56f593e1971d4690b3b16b3523f9c7b4

https://api.breezometer.com/baqi/?datetime=2000-07-18T12:00:00&lat=41.8369&lon=-87.6847&key=56f593e1971d4690b3b16b3523f9c7b4