class CharacterTypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user]
      @characters = CharacterType.where(user_id: params[:user])
    else
      @characters = CharacterType.all
    end
  end

  def show
    @character_attributes = @character.character_attributes
  end

  def new
    @character = current_user.character_types.new
  end

  def create
    @character = current_user.character_types.new(charcters_params)
    if @character.save
      flash[:notice] = "New character type created."
      redirect_to character_type_path(@character)
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
      params.require(:character_type).permit(:name, :character_avatar)
    end

    def set_character
      @character = CharacterType.find(params[:id])
    end
end