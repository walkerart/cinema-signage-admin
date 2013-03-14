//= require active_admin/base
//= require slides


#hack to get rid of default "New"  button
# see admin/slides.rb
$(document).on 'ready', ->
  $('.action_item:first').hide();
