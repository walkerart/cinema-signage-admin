//= require active_admin/base
//= require jquery_nested_form
//= require slides


#hack to get rid of default "New"  button
# see admin/slides.rb
$(document).on 'ready', ->
  $('.action_item:first').hide();
