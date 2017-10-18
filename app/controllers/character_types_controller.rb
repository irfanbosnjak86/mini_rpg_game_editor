class CharacterTypesController < ApplicationController
  def index
    @characters = CharacterType.all
  end

  def new
    @character = CharacterType.new
  end

  def create
    @character = CharacterType.new(charcters_params)
    if @character.save
      flash[:notice] = "New character type created."
      redirect_to character_types_path
    else
      render :new
    end
  end

  private 

  def charcters_params
    params.require(:character_type).permit(:name)
  end
end