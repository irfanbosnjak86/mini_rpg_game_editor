class CharacterAttributesController < ApplicationController
  def create
    @character = CharacterType.find(params[:character_type_id])
    @character_attribute = @character.character_attributes.create(character_attributes_params)
    redirect_to @character
  end

  private

  def character_attributes_params
    params.require(:character_attribute).permit(:name, :numerical_value)
  end
end