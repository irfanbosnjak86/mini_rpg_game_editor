class CharacterType < ApplicationRecord
  belongs_to :user
  mount_uploader :character_avatar, CharacterAvatarUploader
  
  validates :name, :character_avatar, presence: true


end
