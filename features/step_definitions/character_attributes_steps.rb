Given(/^Charactes have attributes$/) do
  chars = CharacterType.all
  chars.each do |char|
    # CharacterAttribute.create!(character_type_id: char.id, name: "Speed", numerical_value: 30)
  end
end

Then(/^I should have (\d+) character attribute for "([^\"]*)"$/) do |count, string|
  char = CharacterType.find_by(string)
  char.character_attributes.count == count
end