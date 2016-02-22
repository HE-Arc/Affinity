# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Add a few sample data

# heroes = {name => display name}

require "json"

heroes = JSON.parse(File.read("./db/migrate/resources/heroes.json"))

uri_placeholder = "<hero_name>"
uri_template = "http://cdn.dota2.com/apps/dota2/images/heroes/#{uri_placeholder}_full.png"

hero_prefix = "npc_dota_hero_"

heroes["result"]["heroes"].each do |hero|
  db_name = hero["name"].sub(hero_prefix, "")

  Hero.create(
      id: hero["id"],
      name: db_name,
      display_name: hero["localized_name"],
      uri: uri_template.sub(uri_placeholder, db_name)
  )
end
