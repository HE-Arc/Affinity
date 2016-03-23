class Relation < ActiveRecord::Base
  #Validates uniqueness of pairs Left-Right
  validates_uniqueness_of :hero_left, :scope => [:hero_right]
  validates_uniqueness_of :hero_right, :scope => [:hero_left]

  scope :best, ->(hero_id) {
    Hero.find(where(hero_left: hero_id).order("score desc").limit(5).pluck(:hero_right))
  }

  scope :worst, ->(hero_id) {
    Hero.find(where(hero_left: hero_id).order("score asc").limit(5).pluck(:hero_right))
  }
end
