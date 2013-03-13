When(/^I am creating a new slide$/) do
  visit new_admin_slide_path(panels: 1)
end

When(/^I enter the following:$/) do |table|
  hash = table.hashes.first
  within "#new_slide" do
    fill_in "Text", text: true, with: hash['Text']
    fill_in "Background color", select: true, with: hash['Background color']
  end
end

And(/^I save it$/) do
  find("input[name='commit']").click
  page.body.should include "Slide was successfully created"
end

Then(/^I should be able to download the xml output of slides$/) do
  visit admin_slides_path(format: 'xml')
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


When(/^I am on slides page$/) do
  visit admin_slides_path
end

When(/^I click on the create full panel slide link$/) do
  find("a[href='#{new_admin_slide_path(panels: 1)}']").click
end

Then(/^I should see one panel$/) do
  page.should have_selector('.panel', count: 1)
end

When(/^I click on the create three panel slide link$/) do
  find("a[href='#{new_admin_slide_path(panels: 3)}']").click
end

Then(/^I should see three panels$/) do
  page.should have_selector('.panel', count: 3)
end
