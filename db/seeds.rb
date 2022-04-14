# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

tarja = Artist.create!(
  email: "tarja.turunen@example.com",
  first_name: "Tarja",
  last_name: "Turunen"
)

Item.create!(
  [
    {
      title: "Dead promises",
      description: "Why have you wasted the time drown in hideous nights?...",
      artist: tarja,
    },
    {
      title: "Goodbye stranger",
      description: "Let ig, let it go",
      artist: tarja,
    },
    {
      title: "Tears in the rain",
      description: "Dominos fall In a house that's empty",
      artist: tarja,
    },
    {
      title: "Spirits of the sea",
      description: "Never let them go Where the stars can’t reach",
      artist: tarja,
    }
  ]
)
