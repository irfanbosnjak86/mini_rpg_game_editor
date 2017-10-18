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
