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

When(/^I click "([^\"]*)" within "([^\"]*)"$/) do |button, name|
  # byebug
  within(:xpath, "//ul/li[contains(.,'#{name}')]") do
    find(:xpath, "//span/a[contains(.,'#{button}')]").click
  end
end

Then(/^I edit attributes "([^\"]*)" "([^\"]*)" with "([^\"]*)" and "([^\"]*)" with (\d+)$/) do |field, string, value, field2, value2|
  fill_in("Name", with: value)
  fill_in("Numerical value", with: value2)
end
