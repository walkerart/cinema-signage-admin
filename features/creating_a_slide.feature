@javascript
Feature: Creating a slide
As a cinema wall admin
I want to display show information on the wall
In order to sell more tickets

The "Default Slides" scenario is the bare minimum amount of work that would need
to be done to get a working export of slide data.

If panel text has one or two lines it is type title.
If panel text has five lines it is type detail.
If panel text has three or four lines it is invalid. 

Scenario: Default Slides
  When I am creating a new slide
  And I save it
  Then I should be able to download the xml output of slides
  And it should look like the file: "features/example.xml"

Scenario: Creating a Full Panel Slide 
  When I am on slides page
  And I click on the create full panel slide link
  Then I should see one panel

Scenario: Creating a three panel Slide 
  When I am on slides page
  And I click on the create three panel slide link
  Then I should see three panels

Scenario: Creating a three panel slide with images
  When I create a three panel slide
  Then I should see a image field on the first panel
  And I should see text areas on the other two
  
Scenario: One of each type
  When I create a three panel slide
  And I choose pink from color
  And I add an image to panel one
  And then i fill in panel two text with:  
  """
  Artist’s Cinema: William E. Jones
  Discussion and Screening
  Friday, April 12, 7:30 pm
  Saturday, April 13, 3 pm
  $9/$7 Members, Students and Seniors
  """
  And i fill in panel three text with:
  """
  WILLIAM E. 
  JONES
  """
  And I save it
  Then I should be able to download the xml output of slides
  And it should contain the first panel:
  """
    <panel>
      <position>0</position>
      <type>image</type>
      <text></text>
      <color></color>
      <background>http://{some url}.jpg</background>
    </panel>
    """
  And it should contain the second panel:
  """
    <panel>
      <position>1</position>
      <type>detail</type>
      <text><![CDATA[Artist’s Cinema: William E. Jones
Discussion and Screening
Friday, April 12, 7:30 pm
Saturday, April 13, 3 pm
$9/$7 Members, Students and Seniors
]]></text>
      <color>#f0003e</color>
      <background>#00000</background>
    </panel>
  """
  And it should contain the third panel:
  """
    <panel>
      <position>2</position>
      <type>title</type>
      <text><![CDATA[WILLIAM E. 
JONES]]></text>
      <color>#00000</color>
      <background>#f0003e</background>
    </panel>
  </slide>
  """
