class CharacterTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = CharacterType.all
  end

  def show
  end

  def new
    @character = current_user.character_types.new
  end

  def create
    @character = current_user.character_types.new(charcters_params)
    if @character.save
      flash[:notice] = "New character type created."
      redirect_to character_types_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @character.update(charcters_params)
      flash[:notice] = "Character type successfuly updated."
      redirect_to character_types_path
    else
      render :edit
    end  
  end

  def destroy
    @character.destroy
    redirect_to character_types_path
  end

  private 

    def charcters_params
      params.require(:character_type).permit(:name)
    end

    def set_character
      @character = CharacterType.find(params[:id])
    end
end