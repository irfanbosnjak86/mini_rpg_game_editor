Given(/^Charactes have attributes$/) do
  chars = CharacterType.all
  chars.each do |char|
    CharacterAttribute.create!(character_type_id: char.id, name: "Speed", numerical_value: 30)
  end
end

Then(/^I fill out the attribute form$/) do
  fill_in("Name", with: "Speed")
  fill_in("Numerical value", with: 30)
end

Then(/^I should have (\d+) more character attribute on "([^\"]*)"$/) do |count, string|
  char = CharacterType.find_by_name(string)
  expect(char.character_attributes.count).to eq(count + 1) 
end
