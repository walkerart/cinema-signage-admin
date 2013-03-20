@javascript
Feature: Creating a slide
As a cinema wall admin
I want to display show information on the wall
In order to sell more tickets

The "First Slide" scenario is the bare minimum amount of work that would need
to be done to get a working export of slide data - which is mearly creating it.

If the text has one or two lines it is type title
If the text has five lines it is type detail
If text has three or four lines it is invalid 

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
      <slide>
            <panel>
                <position>1</position>
                <type>full</type>
                <text>WALKER</text>
				        <color>#000000</color>
                <background>#FFFFFF</background>
            </panel>
        </state>
        <state>
            <panel>
                <position>1</position>
                <type>full</type>
                <text>CINEMA</text>
				        <color>#FFFFFF</color>
                <background>#000000</background>
            </panel>
        </slide>
      <slide>
          <panel>
              <position>1</position>
              <type>full</type>
              <text></text>
			        <color>#000000</color>
              <background>/Users/ajwarnick/Desktop/Master_last_frame.jpg</background>
          </panel>
      </slide>
      
      
      <slide type="one">
        <panel>
          <position>0</position>
          <type>color</type>
          <text>EXAMPLE</text>
          <color>#00000</color>
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

Scenario: Creating a three panel slide with images
  When I create a three panel slide
  Then I should see a image field on the first panel
  And I should see text areas on the other two

Scenario: Toggling a panel
  When I create a three panel slide
  Then I should be able to toggle image/text fields on each panel
  
Scenario: First Slide
  When I am creating a new slide
  And I add one of each type
  And I choose pink from color
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
  And it should look like:
  """
  <slide type="three">
    <panel>
      <position>0</position>
      <type>image</type>
      <text></text>
      <color></color>
      <background>http://cinema-wall.s3.amazonaws.com/2013/03/20/10/28/34/677/da648e94e3595b094d060a21633e35b5.jpg</background>
    </panel>
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
