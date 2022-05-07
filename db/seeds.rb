# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user1 = User.create(name: "Dimitris", surname: "Kolovos", username: "dimKol123", user_id: "user_id_dev_1", date_of_birth: "20/10/1998", address: "An. Stamou 4", email: "d.kolovos@test.com") 
user2 = User.create(name: "Petros", surname: "Kolovos", username: "pkol1543", user_id: "user_id_dev_2", date_of_birth: "20/10/1973", address: "An. Stamou 5", email: "p.kolovos@test.com") 
user3 = User.create(name: "Marios", surname: "Kolovos", username: "marKollll", user_id: "user_id_dev_3", date_of_birth: "20/10/2000", address: "An. Stamou 6", email: "m.kolovos@test.com") 