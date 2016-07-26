$(document).on 'change', '.btn-file :file', ->
  input = $(this)
  numFiles = if input.get(0).files then input.get(0).files.length else 1
  label = input.val().replace(/\\/g, '/').replace(/.*\//, '')
  input.trigger 'fileselect', [
    numFiles
    label
  ]
  return


# document ready

$ ->
  $(".select2").select2()
  #$(".bootstrap-switch").bootstrapSwitch()
  #$(".bootstrap-toggle").bootstrapToggle()
  $('.btn-file :file').on 'fileselect', (event, numFiles, label) ->
    input = $(this).parents('.input-group').find(':text')
    log = if numFiles > 1 then numFiles + ' files selected' else label
    if input.length
      input.val log
    else
      if log
        alert log
    return
  $(".go-button").on 'click', (event) ->
    link = $(this).attr("data-source")
    url = $(link).val()
    if url
      window.location.href = url
    return
  $('.ajax-toggle').on 'click', (event) ->
    target = $(event.target)
    target.removeClass 'btn-default'
    target.removeClass 'btn-success'
    target.addClass 'btn-warning'
    target.text '...'
    return


  #ace editor
  if $("#editor").length > 0
    e = ace.edit("editor")
    e.setTheme('ace/theme/merbivore')
    e.getSession().setTabSize(2)
    e.getSession().setUseSoftTabs(true)

  #best in place
  jQuery(".best_in_place").best_in_place()

  return
