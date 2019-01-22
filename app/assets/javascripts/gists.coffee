
  $(document).on('turbolinks:load', () ->
    textAreas = document.getElementsByTagName("textarea")
    contentTextAreas = []
    for ta in textAreas
      match = ta.parentNode.querySelector('[id^="gist_g_files_attributes"]')
      if match != null
        contentTextAreas.push(match)
    window.editors = []
    window.editors.push(CodeMirror.fromTextArea(textArea, { lineNumbers: true})) for textArea in contentTextAreas
  )
