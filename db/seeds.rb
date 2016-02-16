# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Add a few sample data

# heroes = {name => display name}

heroes = {
    "Earthshaker" => "Earthshaker",
    "Shredder" => "Timbersaw",
    "Wisp" => "Io",
    "Doom Bringer" => "Doom",
    "Obsidian Destroyer" => "Outworld Devourer"
}

uri = "http://cdn.dota2.com/apps/dota2/images/heroes/<hero_name>_full.png"

heroes.each do |name, display_name|
  db_name = name.downcase.sub(" ", "_")
  Hero.create(name: db_name, display_name: display_name, uri: uri.sub("<hero_name>", db_name))
end