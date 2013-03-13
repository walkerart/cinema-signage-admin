@javascript
Feature: Creating a slide
As a cinema wall admin
I want to display show information on the wall
In order to sell more tickets

The "First Slide" scenario is the bare minimum amount of work that would need
to be done to get a working export of slide data.

Scenario: First Slide
  When I am creating a new slide
  And I save it
  Then I should be able to download the xml output of slides
  And it should look like:
  """
  <cinema>
    <title>Cinema Signage</title>
    <link>http://walkerart.org/</link>
    <description>Cinema Signage Feed</description>
    <views>
      <slide type="one">
        <panel>
          <position>0</position>
          <type>color</type>
          <background>#ffffff</background>
        </panel>
      </slide>
    </views>
  </cinema>
  """

Scenario: Creating a Full Panel Slide 
  When I am on slides page
  And I click on the create full panel slide link
  Then I should see one panel

Scenario: Creating a three panel Slide 
  When I am on slides page
  And I click on the create three panel slide link
  Then I should see three panels

