Given(/^I have character types named (.+)$/) do |names|
  names.split(", ").each do |name|
    CharacterType.create!(name: name)
  end
end

When(/^I go to the list of character types$/) do
  visit character_types_path
end

Then(/^I should see "([^\"]*)"$/) do |string|
  expect(page).to have_content(string)
end

Given(/^I have no character types$/) do
  CharacterType.delete_all
end

Given(/^I am on the list of character types$/) do
  visit character_types_path
end

When(/^I follow "([^\"]*)"$/) do |link|
  click_link(link)
end

When(/^I fill in "([^\"]*)" with "([^\"]*)"$/) do |field, value|
  fill_in(field, :with => value) 
end

When(/^I press "([^\"]*)"$/) do |button|
  click_button(button)
end

Then(/^I should have (\d+) character type$/) do |count|
  CharacterType.count.should == count.to_i
end
