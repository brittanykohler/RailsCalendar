users = [
  {name: "Taylor", bio: "#SquadGoals"},
  {name: "Beyonce", bio: "Queen Bey"},
  {name: "Katy", bio: "Friends with left shark"},
  {name: "Adele", bio: "Too many grammys to count"},
]

users.each do |user|
  User.create user
end

events = [
  {name: "Fill that blank space", description: "I guess I'll write your name", event_date: Date.new(2015, 12, 25).to_datetime + Time.parse("17:30").seconds_since_midnight.seconds, user_id: 1},
  {name: "Shake it off", description: "This is to the fella over there with the hella good hair", event_date: Date.new(2015, 12, 17).to_datetime + Time.parse("19:00").seconds_since_midnight.seconds, user_id: 1},
  {name: "Run the world", description: "GIRLS", event_date: Date.new(2015, 12, 15).to_datetime + Time.parse("12:00").seconds_since_midnight.seconds, user_id: 2},
  {name: "Hang with all the single ladies", description: "Perhaps someone will put a ring on it", event_date: Date.new(2015, 12, 26).to_datetime + Time.parse("11:30").seconds_since_midnight.seconds, user_id: 2},
  {name: "Dye hair blue", description: "Hanging with the California gurls", event_date: Date.new(2015, 12, 27).to_datetime + Time.parse("10:30").seconds_since_midnight.seconds, user_id: 3},
  {name: "Roar", description: "Louder than a lion", event_date: Date.new(2015, 12, 10).to_datetime + Time.parse("16:30").seconds_since_midnight.seconds, user_id: 3},
  {name: "Say hello", description: "From the other side", event_date: Date.new(2015, 12, 05).to_datetime + Time.parse("17:30").seconds_since_midnight.seconds, user_id: 4},
  {name: "Find someone like you", description: "Nevermind", event_date: Date.new(2015, 12, 13).to_datetime + Time.parse("17:30").seconds_since_midnight.seconds, user_id: 4},
]

events.each do |event|
  Event.create event
end
