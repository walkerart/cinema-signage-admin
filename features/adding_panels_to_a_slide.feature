@javascript
Feature: Adding Panels to a Slide
As a cinema wall admin
I want to add media and text to panels within a slide
In order to draw attention to the wall and sell more tickets


The panels should be ordered by dragging them. They should mimick the real
panels on the wall by aligning three in a horizontal row.


Scenario: Adding a second panel
  Given I am on the new slide page
  And I add a panel
  Then I should be able to reorder them by dragging
  

