# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


mgm = Studio.create(name:"MGM", location:"Hollywood")
scream = Movie.create(title:"Scream", year: 1998, genre:"Horror", studio_id: mgm.id)
courtney = scream.actors.create(name: "Courtney Cox", age: 56)
neve = scream.actors.create(name: "Neve Campbell", age: 42)
rose = scream.actors.create(name: "Rose McGowan", age: 46)
lionsgate = Studio.create(name:"Lions Gate", location:"LA")
space_jam = Movie.create(title:"Space Jam", year: 1993, genre:"Comedy", studio_id: mgm.id)
old_school = Movie.create(title:"Old School", year: 2001, genre:"Comedy", studio_id: lionsgate.id)
