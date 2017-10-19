class CharacterType < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true

  mount_uploader :character_avatar, CharacterAvatarUploader
end
