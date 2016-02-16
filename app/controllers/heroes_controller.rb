class HeroesController < ApplicationController

  def index
    @heroes = Hero.all
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
