//= require active_admin/base
//= require jquery_nested_form

$(document).on 'ready', ->
  $('.sortable').sortable
    items: '> .fields'
    update: (event, ui)->
      $.each $('.sortable > .fields'), (i, li) ->
        #using rails naming convention of name="object[attribute]"
        $(li).find("input[name$='order]']").val(i)
        


$(document).on 'click', '.color', (event)->
  color = $(event.target)
  console.log color      
  bg = color.closest('.panel').find("input[name$='background_color]']")
  bg.attr('value', color.data('color'))
  $.each color.siblings(), (i, obj)->
    $(obj).removeAttr('data-selected')
  color.attr('data-selected', 'selected')

