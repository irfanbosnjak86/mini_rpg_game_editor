class CharacterTypesController < ApplicationController
  def index
    @characters = CharacterType.all
  end
end