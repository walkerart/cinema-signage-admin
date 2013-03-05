Feature: Create a new Slide
As a cinema admin
I would like to add new slide with information about a show
In order to sell tickets to the show.

@javascript
Scenario: Building a Slide
  When I am on the slides page
  And I create a new slide
  Then I should be able to select the background color from:
  | blue   |
  | purple |
  | orange |
  | yellow |
  | white  |
  | green  |
  | pink   |
  And I should be able to add a new panel to the slide
  And I should be able to select the panel type from:
  | Blank  |
  | Title  |
  | Detail |
  And I should be able to save the slide


