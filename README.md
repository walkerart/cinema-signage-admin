git clone git@github.com:walkerart/cinema_wall.git  
cd cinema_wall (yes to rvm)  
bundle  
rake db:migrate  
rails s  
admin@example.com:password@localhost:3000/admin  


There is no validation, no tests.
This is only a "tracer bullet" as they say in the book _The Pragmatic Programmer_.
It will allow us to verify that we are on the right track.

The xml export link on the /admin/states page uses app/views/states/index.xml.builder.

The next steps would be to pimp out the state form in app/views/admin/_form.html.haml
with the javascripts.

Then whatever comes up.

Then deployment.
