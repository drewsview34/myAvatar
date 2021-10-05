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
  :option_keys =>
   ["name", "super_power", "super_weakness"],
  :options => [
    ["Batman", "technology","mortal"],
    ["Superman", "strength", "lois"],
    ["Hulk", "anger", "therapy"],
    ["Captain America", "strength", "mortal"],
    ["Spiderman", "spider like abilites","love"],
    ["Iron Man", "technology", "arrogance"],
    ["Godzilla", "radiation", "humans"],
    ["Wolverine", "reflexes", "sensitive"],
    ["Black Panther", "superhuman senses", "nationalism"]
  ],
  :admins => [
    "Andrew Hinojosa",
    "Ryna Truong"
  ]
}

def main
  make_users
  make_admin
  make_options_and_avatars
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

def make_options_and_avatars
  DATA[:options].each do |option|
    new_option = Option.new
    option.each_with_index do |attribute, i|
      new_option.send(DATA[:option_keys][i] + "=", attribute)
    end
    rand(1..8).times do
      avatars = []
      User.all.each{|u| avatars << u if u.admin != true}
      new_option.users << avatars[rand(0...avatars.length)]
    end
    new_option.users.each {|c| c.save}
    new_option.save
  end
end

main