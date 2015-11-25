users = [
  {name: "Brittany", bio: "Likes calendars", color: "gray"},
  {name: "Kristi", bio: "Brittany's roommate", color: "green"},
  {name: "Kat", bio: "Birthday girl", color: "purple"},
  {name: "Kelly", bio: "Down under", color: "blue"},
]

users.each do |user|
  User.create user
end

events = [
  {name: "Go to Taco Time", description: "Mexi fries all day", event_date: Date.new(2015, 11, 25).to_datetime + Time.parse("17:30").seconds_since_midnight.seconds, user_id: 1},
  {name: "Play volleyball", description: "watch the knee", event_date: Date.new(2015, 11, 17).to_datetime + Time.parse("19:00").seconds_since_midnight.seconds, user_id: 1},
  {name: "Go on a walk", description: "must meet step goal", event_date: Date.new(2015, 11, 15).to_datetime + Time.parse("12:00").seconds_since_midnight.seconds, user_id: 2},
  {name: "Cook turkey", description: "Thanksgiving", event_date: Date.new(2015, 11, 26).to_datetime + Time.parse("11:30").seconds_since_midnight.seconds, user_id: 2},
  {name: "Teen Wolf", description: "Because it's a husky game", event_date: Date.new(2015, 11, 27).to_datetime + Time.parse("10:30").seconds_since_midnight.seconds, user_id: 3},
  {name: "Walk Jiji", description: "Cats deserve to be walked too", event_date: Date.new(2015, 11, 10).to_datetime + Time.parse("16:30").seconds_since_midnight.seconds, user_id: 3},
  {name: "Host a brunch", description: "a blessed brunch!", event_date: Date.new(2015, 11, 05).to_datetime + Time.parse("17:30").seconds_since_midnight.seconds, user_id: 4},
  {name: "Talk to Keith Urban", description: "Maybe Nicole Kidman too", event_date: Date.new(2015, 11, 13).to_datetime + Time.parse("17:30").seconds_since_midnight.seconds, user_id: 4},
]

events.each do |event|
  Event.create event
end
