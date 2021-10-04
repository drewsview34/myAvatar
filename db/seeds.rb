# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
  :user_keys =>
    ["name", "password"],
  :users => [
    ["Max Charles", "password"],
    ["Skai Jackson", "password"],
    ["Kaleo Elam", "password"],
    ["Megan Charpentier", "password"],
    ["Hayden Byerly", "password"],
    ["Tenzing Norgay Trainor", "password"],
    ["Davis Cleveland", "password"],
    ["Cole Sand", "password"],
    ["Quvenzhané Wallis", "password"]
  ],
  :attraction_keys =>
   ["name", "nausea_rating", "happiness_rating", "tickets", "min_height"],
  :attractions => [
    ["Scrambler Ride", 2, 2, 2, 36],
    ["Miniature Railroad", 0, 1, 2, 32],
    ["Merry-Go-Round", 1, 1, 1, 30],
    ["Roller Coaster", 1, 3, 4, 54],
    ["Swinging Ship", 2, 2, 2, 36],
    ["Go Karts", 1, 2, 3, 36],
    ["Haunted Mansion", 1, 1, 1, 30],
    ["Ferris Wheel", 1, 1, 2, 36],
    ["Teacups Ride", 3, 1, 1, 28]
  ],
  :admins => [
    "Mary Elitch Long",
    "John Elitch"
  ]
}

def main
  make_users
  make_admin
  make_attractions_and_rides
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_admin
  DATA[:admins].each do |name|
    User.create(name: name, admin: true, password: 'password')
  end
end

def make_attractions_and_rides
  DATA[:attractions].each do |attraction|
    new_attraction = Attraction.new
    attraction.each_with_index do |attribute, i|
      new_attraction.send(DATA[:attraction_keys][i] + "=", attribute)
    end
    rand(1..8).times do
      customers = []
      User.all.each {|u| customers << u if u.admin != true}
      new_attraction.users << customers[rand(0...customers.length)]
    end
    new_attraction.users.each {|c| c.save}
    new_attraction.save
  end
end

main