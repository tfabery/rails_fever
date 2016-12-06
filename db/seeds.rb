# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create(username: 'admin', password: 'password', email: 'admin@admin.com')
streamers = Streamer.create ([
  {name: 'Faker', channel_name: 'fakerlivestream'},
  {name: 'Dyrus', channel_name: 'tsm_dyrus'},
  {name: 'Scarra', channel_name: 'scarra'},
  {name: 'ImaQTpie', channel_name: 'imaqtpie'},
  {name: 'Box Box', channel_name: 'flosd'},
  {name: 'BunnyFuFuu', channel_name: 'bunnyfufuu'}
])
rooms = Room.create([
  {streamer_id: 1},
  {streamer_id: 2},
  {streamer_id: 3},
  {streamer_id: 4},
  {streamer_id: 5},
  {streamer_id: 6}
  ])
