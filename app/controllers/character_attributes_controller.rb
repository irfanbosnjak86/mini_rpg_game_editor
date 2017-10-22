class CharacterAttributesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_char_attr, only: [:edit, :update, :destroy]

  def new
    @character = CharacterType.find(params[:character_type_id])
    @character_attribute = @character.character_attributes.new

    respond_to do |format|
      format.js { render 'new.js'}
    end
  end
  
  def create
    @character = CharacterType.find(params[:character_type_id])
    @character_attribute = @character.character_attributes.create(character_attributes_params)
    
    respond_to do |format|
      format.js { render 'create.js'}
    end
  end

  def edit
  end

  def update
    if @character_attribute.update(character_attributes_params)
      redirect_to @character
    end
  end

  def destroy
    @character_attribute.destroy
    redirect_to @character
  end

  private

  def character_attributes_params
    params.require(:character_attribute).permit(:name, :numerical_value)
  end

  def set_char_attr
    @character = CharacterType.find(params[:character_type_id])
    @character_attribute = @character.character_attributes.find(params[:id])
  end
end