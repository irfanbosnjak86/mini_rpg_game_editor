class CharacterAttribute < ApplicationRecord
  belongs_to :character_type
  mount_uploader :char_attr_avatar, CharAttrAvatarUploader
end
