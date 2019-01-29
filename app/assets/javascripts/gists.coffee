
# CODE MOVED INTO STIMULUS INITIALIZE()
#  $(document).on('turbolinks:load', () ->
#    textAreas = document.getElementsByTagName("textarea")
#    contentTextAreas = []
#    for ta in textAreas
#      match = ta.parentNode.querySelector('[id^="gist_g_files_attributes"]')
#      if match != null
#        contentTextAreas.push(match)
#    window.editors = {}
#    i = 0
#    for textArea in contentTextAreas
#      window.editors[i.toString()] = CodeMirror.fromTextArea(textArea, { lineNumbers: true, mode: 'text/plain'})
#      i+=1
#  )
