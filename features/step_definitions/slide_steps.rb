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

When(/^I create a three panel slide$/) do
  visit new_admin_slide_path(panels: 3)
end

When(/^I add an image to the first panel$/) do
  pending
end

When(/^I fill in text with "(.*?)" within the first panel$/) do |arg1|
  pending
end

Then(/^I should see a image field on the first panel$/) do
  find('.panel:first').should have_selector("input[type='file']")
end

Then(/^I should see text areas on the other two$/) do
  first, *other_two = *all('.panel')
  other_two.size.should == 2
  other_two.each do |panel|
    panel.should have_selector("textarea")
  end
end

Then(/^I should be able to toggle image\/text fields on each panel$/) do
  all('.panel').each do |panel|
    within panel do 
      click_link "image"
      panel.should have_selector('input.file')
    end
  end
end

Then(/^it should look like the file: "(.*?)"$/) do |path|
  page.body.should eq open(Rails.root.join(path)).read.chomp
end

When(/^I choose pink from color$/) do
  find("[data-color='#f0003e']").click
end

When(/^then i fill in panel two text with:$/) do |string|
  within all('.panel')[1] do
    fill_in 'Text',  with: string
  end
end

When(/^i fill in panel three text with:$/) do |string|
  within all('.panel')[2] do
    fill_in 'Text',  with: string
  end
end

Then(/^it should contain .*:$/) do |string|
  pending('should probably render each panel in it\'s own _panel file ')
  page.body.should include(string)
end

And(/^I add an image to panel one$/) do
  within all('.panel')[0] do
    attach_file 'Background file', Rails.root.join('features/github_image.png')
  end
end
