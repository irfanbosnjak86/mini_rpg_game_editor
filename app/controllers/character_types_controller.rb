class CharacterTypesController < ApplicationController
  def index
    @characters = CharacterType.all
  end

  def new
    @character = CharacterType.new
  end

  def create
    @character = CharacterType.create(charcters_params)
    flash[:notice] = "New character type created."
    redirect_to character_types_path
  end

  private 

  def charcters_params
    params.require(:character_type).permit(:name)
  end
end