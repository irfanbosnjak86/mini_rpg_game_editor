Given(/^Charactes have attributes$/) do
  chars = CharacterType.all
  file =  File.open("#{Rails.root}/spec/support/avatars/test.jpg")
  char_attributes = {"Speed": 30, "Strength": 40}
  # count is 2, because we are creating 2 attributes per each chars
  chars.each do |char|
    char_attributes.each do |name, value|
      CharacterAttribute.create!(character_type_id: char.id, name: name, 
                              numerical_value: value, char_attr_avatar: file)
    end
  end
end

Then(/^I fill out the attribute form$/) do
  fill_in('character_attribute[name]', with: "Speed")
  fill_in('character_attribute[numerical_value]', with: 30)
  click_button("Add Attribute Avatar")
  file =  File.open("#{Rails.root}/spec/support/avatars/test.jpg")
  attach_file('character_attribute[char_attr_avatar]', file.path, visible: false)
end

Then(/^I should have (\d+) "([^\"]*)" character attribute on "([^\"]*)"$/) do |count, condition_string, string|
  # take a look "Characters have attributes" step
  count = 2
  if condition_string == "more"
    count += 1
  else
    count -= 1
  end

  char = CharacterType.where(name: string).first
  expect(char.character_attributes.count).to eq(count) 
end

When(/^I click "([^\"]*)" at the end of "([^\"]*)" attribute of "([^\"]*)"$/) do |button, 
                                                                                  attr_name, char_type_name|
  chars = CharacterType.where(name: char_type_name)
  char = chars.first
  char_attr = char.character_attributes.where(name: attr_name).first

  within(:css, ".row#char-attr-#{char_attr.id}") do
    within(:css, ".char-options") do
      click_link(button)
    end
  end
end

Then(/^I edit attributes "([^\"]*)" "([^\"]*)" with "([^\"]*)" and "([^\"]*)" with (\d+)$/) do |field, string, value, field2, value2|
  fill_in('character_attribute[name]', with: value)
  fill_in('character_attribute[numerical_value]', with: value2)
end


Given(/^I am on "([^\"]*)" page$/) do |char_type|
  visit root_path

  within(:css, "#char-1") do 
    click_link(char_type)
  end
  
  expect(current_path).to eq("/character_types/1")
end

Then(/^I should see char attr avatar for "([^\"]*)" "([^\"]*)" of "([^\"]*)"$/) do |char_attr_name, 
  char_attr_val, char_type_name|
  chars = CharacterType.where(name: char_type_name)
  char = chars.first
  char_attr = char.character_attributes.where(name: char_attr_name, numerical_value: char_attr_val).first

  find(:css, "img#char-attr-avatar-#{char_attr.id}")
end


When(/^I follow first "([^\"]*)"$/) do |name|
  chars = CharacterType.where(name: name)
  char = chars.first

  find(:css, "a#link-to-char-#{char.id}", text: name).click
end