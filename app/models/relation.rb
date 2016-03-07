class Relation < ActiveRecord::Base
  #Validates uniqueness of pairs Left-Right
  validates_uniqueness_of :hero_left, :scope => [:hero_right]
  validates_uniqueness_of :hero_right, :scope => [:hero_left]
end
