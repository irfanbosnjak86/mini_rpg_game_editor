class CharacterAttribute < ApplicationRecord
  belongs_to :character_type
  mount_uploader :char_attr_avatar, CharAttrAvatarUploader
  validates :name, :numerical_value, :char_attr_avatar, presence: true
  validates_numericality_of :numerical_value, less_than_or_equal_to: 999, greater_than: 0
end
