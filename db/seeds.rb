# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Add a few sample data

require "json"

# POPULATE HEROES
# Seeding done by a local json file gathered from the Steam Web API

heroes = JSON.parse(File.read("./db/migrate/resources/heroes.json"))

uri_placeholder = "<hero_name>"
uri_template = "http://cdn.dota2.com/apps/dota2/images/heroes/#{uri_placeholder}_full.png"

hero_prefix = "npc_dota_hero_"

heroes["result"]["heroes"].each do |hero|
  db_name = hero["name"].sub(hero_prefix, "")

  Hero.create(
      id: hero[:id],
      name: db_name,
      display_name: hero["localized_name"],
      uri: uri_template.sub(uri_placeholder, db_name)
  )
end

# Add attributs default values
Attribute.create(name: "Strength")
Attribute.create(name: "Agility")
Attribute.create(name: "Intelligence")


# POPULATE AFFINITIES
# Generating all pairs of heroes and attributing them random score
# TODO Generate every pair of heroes and attribute score based on match data gathered from the Steam Web API

heroes = Hero.all

heroes.each do |left|
  heroes.each do |right|
    if left[:id] != right[:id]
      Relation.create(
          hero_left: left[:id],
          hero_right: right[:id],
          score: rand(200) - 100
      )
    end
  end
end
