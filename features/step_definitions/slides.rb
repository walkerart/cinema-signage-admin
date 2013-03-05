When(/^I am on the slides page$/) do
  visit admin_slides_path
end

When(/^I create a new slide$/) do
  click_link "New Slide"
end

Then(/^I should be able to select the background color from:$/) do |table|
  
  within '#slide_background_color_input' do
    table.raw.flatten do |color|
      assert_select 'input', text: color
    end
  end
end

Then(/^I should be able to add a new panel to the slide$/) do
  click_link "Add Panel"
  save_screenshot 'building-a-slide.png'
  open('building-a-slide.html', 'w+') do |f|
    f.write page.body
  end
end


Then(/^I should be able to select the panel type from:$/) do |table|
  table.raw.flatten do |panel_type|
    assert_select 'input.slide[panel_attributes][0][panel_type]', text: panel_type
  end
end

And(/^I should be able to save the slide$/) do
  click_button "Create Slide"
  page.current_path.should eq admin_slide_path(id: 1)
  page.should have_content "Slide was successfully created"
end
