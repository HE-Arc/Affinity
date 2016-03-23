class HeroesController < ApplicationController

  def index
    @heroes = Hero.all
  end

  def information
    @hero = Hero.find(params[:id])
    @good_heroes = Relation.best(@hero.id)
    @bad_heroes = Relation.worst(@hero.id)
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
