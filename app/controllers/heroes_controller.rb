class HeroesController < ApplicationController

  def index
    @heroes = Hero.all
  end
  
  def information
    @hero = Hero.find(params[:id])

    #Get 5 good affinites heroes
    @goods = Relation.where(:hero_left == params[:id]).order("score desc").limit(5)

    @good_heroes = []
    @goods.each do |good|
      @good_heroes.append(Hero.find(good.hero_left))
    end

    #Get 5 bad affinities heroes
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
