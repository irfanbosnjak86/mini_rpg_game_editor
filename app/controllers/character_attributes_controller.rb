class CharacterAttributesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_char_attr, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update]

  def new
    @character = CharacterType.find(params[:character_type_id])
    @character_attribute = @character.character_attributes.new

    respond_to do |format|
      format.js { render :new }
    end
  end
  
  def create
    @character = CharacterType.find(params[:character_type_id])
    @character_attribute = @character.character_attributes.new(character_attributes_params)
    
    respond_to do |format|
      if @character_attribute.save
        format.js { render :create }
      else
        format.js { render :new }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js { render :edit }
    end
  end

  def update
    respond_to do |format|
      if @character_attribute.update(character_attributes_params)
        format.js { render :update }
      else
        format.js { render :edit }
      end
    end
  end

  def destroy
    @character_attribute.destroy
    respond_to do |format|
      format.js { head :no_content }
    end
  end

  private

  def character_attributes_params
    params.require(:character_attribute).permit(:id, :character_type_id, :name, 
                                                :numerical_value, :char_attr_avatar)
  end

  def set_char_attr
    @character = CharacterType.find(params[:character_type_id])
    @character_attribute = @character.character_attributes.find(params[:id])
  end

  def check_user
    unless current_user.id == @character.user_id
      flash[:alert] = "You dont have permition to add attributes"
      redirect_to @character 
    end
  end
end