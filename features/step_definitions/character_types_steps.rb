Given(/^I have character types named (.+)$/) do |names|
  names.split(", ").each do |name|
    CharacterType.create!(name: name)
  end
end

When(/^I go to the list of character types$/) do
  visit character_types_path
end

Then("I should see {string}") do |string|
  expect(page).to have_content(string)
end

Given("I have no character types") do
  CharacterType.delete_all
end

Given("I am on the list of character types") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I follow {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I fill in {string} with {string}") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I press {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should have {int} character type") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end
