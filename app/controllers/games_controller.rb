class GamesController < ApplicationController
  before_action :authenticate_researcher!
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @games = Game.all
    respond_with(@games)
  end

  def show
    respond_with(@game)
  end

  def new
    @game = Game.new
    respond_with(@game)
  end

  def edit
  end

  def create
    @game = Game.new(game_params)
    @game.save
    respond_with(@game)
  end

  def update
    @game.update(game_params)
    respond_with(@game)
  end

  def destroy
    @game.destroy
    respond_with(@game)
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :description, :link, :how_to_play, :easy_of_use, :content_quality, :versatility, :pedagogical_aspects, :didactical_resources, :stimulates_the_initiative_and_self_learning, :audiovisual_quality, :technical_and_static_elements, :navigation_and_interaction, :originality_and_use_of_advanced_tecnology)
    end
end
