# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

initial_genres = [
  {name: "ケーキ"},
  {name: "プリン"},
  {name: "焼き菓子"},
  {name: "キャンディ"}
]
Genre.create(initial_genres)

Admin.create!(
   email: 'nagano@gmail',
   password: 'nagano',
   password_confirmation: "nagano"
)