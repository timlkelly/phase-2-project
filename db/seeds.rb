tim   = User.create!({first_name: "tim", last_name: "kelly", email: "timlkelly@gmail.com", password: "password"})
lydia = User.create!({first_name: "lydia", last_name: "nash", email: "lydiamnash@gmail.com", password: "password"})

chicago  = Location.create!({latitude: 41.8369,  longitude: 87.6847})
berkeley = Location.create!({latitude: 122.2728, longitude: 37.8717})
oakland  = Location.create!({latitude: 122.2708, longitude: 37.8044})
london   = Location.create!({latitude: 0.1275,   longitude: 51.5072})
evanston = Location.create!({latitude: 87.6947,  longitude: 42.0464})

assocation  = SavedLocation.create!({ location_id: 1, user_id: 1, name: "Home" })
assocation1 = SavedLocation.create!({ location_id: 4, user_id: 1, name: "Study Abroad" })
assocation2 = SavedLocation.create!({ location_id: 2, user_id: 2, name: "Home" })
assocation3 = SavedLocation.create!({ location_id: 3, user_id: 2, name: "Second Home" })
