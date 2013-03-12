When(/^I am creating a new slide$/) do
  visit new_admin_slide_path
end

When(/^I enter the following:$/) do |table|
  hash = table.hashes.first
  within "#new_slide" do
    fill_in "Text", text: true, with: hash['Text']
    fill_in "Background color", select: true, with: hash['Background color']
  end
end
And(/^I save it$/) do
  click_button "Create Slide"
  page.body.should include "Slide was successfully created"
end

Then(/^I should be able to download the xml output of slides$/) do
  visit admin_slides_path(format: 'xml')
  puts page.body
  page.status_code.should be 200
  @it = page.body
end

And(/^it should look like:$/) do |string|
  @it.should eq string
end


Given(/^I am on the new slide page$/) do
  visit new_admin_slide_path
end

Given(/^I add a panel$/) do
  click_link("Add Panel")
end

Then(/^I should be able to reorder them by dragging$/) do
  panel_one, panel_two = *all(".fields")
  panel_two.drag_to panel_one  
  pending "no worky"
end
