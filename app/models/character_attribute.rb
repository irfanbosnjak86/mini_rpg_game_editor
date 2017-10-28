class CharacterAttribute < ApplicationRecord
  belongs_to :character_type
  mount_uploader :char_attr_avatar, CharAttrAvatarUploader
  validates :name, :numerical_value, :char_attr_avatar, presence: true
end
