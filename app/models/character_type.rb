class CharacterType < ApplicationRecord
  belongs_to :user
  has_many :character_attributes, dependent: :destroy
  mount_uploader :character_avatar, CharacterAvatarUploader
  
  validates :name, :character_avatar, presence: true
end
