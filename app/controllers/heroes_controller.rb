class HeroesController < ApplicationController
   
  def index
#   @heroes = Hero.all  
    @attributes = Attribute.all
  end
  
  def information
    @hero = Hero.find(params[:id])

    #Get 5 good affinites heroes
    @goods = Relation.where(hero_left: params[:id]).order("score desc").limit(5)

    @good_heroes = []
    @goods.each do |good|
      @good_heroes.append(Hero.find(good.hero_right))
    end

    #Get 5 bad affinities heroes
    @bads = Relation.where(hero_left: params[:id]).order("score asc").limit(5)

    @bad_heroes = []
    @bads.each do |good|
      @bad_heroes.append(Hero.find(good.hero_right))
    end
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
    if @hero.save
      redirect_to '/heroes'
    else
      render 'new'
    end
  end

  private
  def hero_params
    params.require(:hero).permit(:name).permit(:display_name).permit(:uri)
  end
end
