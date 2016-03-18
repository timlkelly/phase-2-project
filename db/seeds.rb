tim = User.create!({first_name: "tim", last_name: "kelly", email: "timlkelly@gmail.com", password: "password"})
lydia = User.create!({first_name: "lydia", last_name: "nash", email: "lydiamnash@gmail.com", password: "password"})

chicago  = Location.create!({longitude: 41.8369, latitude: 87.6847})
berkeley = Location.create!({longitude: 37.8717, latitude: 122.2728})
oakland  = Location.create!({longitude: 37.8044, latitude: 122.2708})
london   = Location.create!({longitude: 51.5072, latitude: 0.1275})
evanston = Location.create!({longitude: 42.0464, latitude: 87.6947})

assocation  = SavedLocation.create!({ location_id: 1, user_id: 1, name: "Home" })
assocation1 = SavedLocation.create!({ location_id: 4, user_id: 1, name: "Study Abroad" })
assocation2 = SavedLocation.create!({ location_id: 2, user_id: 2, name: "Home" })
assocation3 = SavedLocation.create!({ location_id: 3, user_id: 2, name: "Second Home" })
