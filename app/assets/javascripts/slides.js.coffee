$(document).on 'ready activateSortable', ->
  $('.sortable').sortable
    items: '> .fields'
    axis: 'x'    
    update: (event, ui)->
      $.each $('.sortable > .fields'), (i, li) ->
        #using rails naming convention of name="object[attribute]"
        $(li).find("input[name$='order]']").val(i)

  # hacks to 'configure' default function of batch action
  form = $('.index_as_block').closest('form')
  form.attr('data-remote', 'true')
  form.find("#batch_action").attr("value", "reorder")
  
  $('.index_as_block').sortable
    items: '> .slide'
    axis: 'y'    
    update: (event, ui)->
      $.each $('.slide'), (i, li) ->
        #using rails naming convention of name="object[attribute]"
        $(li).find("input[name$='order]']").val(i)
      form = $(event.target).closest('form')
      form.submit() #not sure how to get the response

$(document).on 'click', '.color', (event)->
  color = $(event.target)
  bg = color.closest('.panel').find("input[name$='background_color]']")
  bg.attr('value', color.data('color'))
  $.each color.siblings(), (i, obj)->
    $(obj).removeAttr('data-selected')
  color.attr('data-selected', 'selected')


$(document).on 'ajax:success', (event, data, xhr, status) ->
  selector = 'form#collection_selection'
  new_form = $(data).find(selector)
  old_form = $(selector)
  old_form.replaceWith(new_form)
  new_form.trigger 'activateSortable'
