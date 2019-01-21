# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$ ->
#  myCodeMirror = CodeMirror.fromTextArea(document.getElementById('myTextArea'), {
#    lineNumbers: true,
#
#  });
##########################################################################33
#@deleteGFile = (divId) ->
#  element = document.getElementById(divId)
#  element.parentNode.removeChild(element)
#  updateGFileDeletes()
#  return
#
#@firstGFileHasDelete = ->
#  element = document.getElementById('gFiles')
#  console.log("child length" + element.children[0].children.length)
#  if element.children[0].children.length == 3
#    console.log("returning true because first gfile has delete")
#    return true
#  else
#    console.log("reutnr false because first gfile doenst have delete")
#    return false
#
#@updateGFileDeletes = ->
#  if (numGFiles() > 1)
#    if !firstGFileHasDelete()
#      addDeleteToFirstGFile()
#  else
#    if firstGFileHasDelete()
#      removeFirstGFileDelete()
#  return
#
#@numGFiles = ->
#  element = document.getElementById('gFiles')
#  return element.children.length
#
#
#@addDeleteToFirstGFile = ->
#  console.log("Add Delete to frist GFile")
#  date = new Date
#  mSec = date.getTime()
#  element = document.getElementById('gFiles')
#  firstGFileDivId = element.children[0].getAttribute('id')
#
#  divDelBtn = document.createElement('div')
#  divDelBtn.setAttribute 'class', 'form-group'
#  divDelBtn.setAttribute 'id', 'del_g_file_btn_0'.replace('0', mSec)
#
#  delBtn = document.createElement('button')
#  delBtn.setAttribute 'class', 'btn btn-danger'
#  delBtn.setAttribute 'type', 'button'
#  delBtn.innerHTML = 'Delete'
#  delBtn.setAttribute 'onclick', 'deleteGFile(\'' + firstGFileDivId + '\')'
#  divDelBtn.appendChild delBtn
#
#  element.children[0].appendChild divDelBtn
#  return
#
#@removeFirstGFileDelete = ->
#  element = document.getElementById('gFiles')
#  delElement = element.children[0].children[2]
#  element.children[0].removeChild(delElement)
#  return
#
#@addGFileField = ->
##create Date object
#  date = new Date
#  #get number of milliseconds since midnight Jan 1, 1970
#  #and use it for address key
#  mSec = date.getTime()
#  #Replace 0 with milliseconds
#  idAttrFilename = 'gist_g_files_attributes_0_filename'.replace('0', mSec)
#  nameAttrFilename = 'gist[g_files_attributes][0][filename]'.replace('0', mSec)
#  idAttrContents = 'gist_g_files_attributes_0_contents'.replace('0', mSec)
#  nameAttrContents = 'gist[g_files_attributes][0][contents]'.replace('0', mSec)
#  #create <li> tag
#  divGroup = document.createElement('div')
#  divGroup.setAttribute 'id', 'g_file_group_0'.replace('0', mSec)
#  divFilename = document.createElement('div')
#  divFilename.setAttribute 'class', 'form-group'
#  divContents = document.createElement('div')
#  divContents.setAttribute 'class', 'form-group'
#  divDelBtn = document.createElement('div')
#  divDelBtn.setAttribute 'class', 'form-group'
#  divDelBtn.setAttribute 'id', 'del_g_file_btn_0'.replace('0', mSec)
#
#  delBtn = document.createElement('button')
#  delBtn.setAttribute 'class', 'btn btn-danger'
#  delBtn.setAttribute 'type', 'button'
#  delBtn.innerHTML = 'Delete'
#  delBtn.setAttribute 'onclick', 'deleteGFile(\'' + 'g_file_group_' +  mSec + '\')'
#  divDelBtn.appendChild delBtn
#  #create label for Name, set it's for attribute,
#  #and append it to <li> element
#  labelFilename = document.createElement('label')
#  labelFilename.setAttribute 'for', idAttrFilename
#  labelFilename.setAttribute 'class', 'sr-only'
#  filenameLabelText = document.createTextNode('Filename')
#  labelFilename.appendChild filenameLabelText
#  divFilename.appendChild labelFilename
##  divFilename.appendChild(document.createElement('br'))
#  #create input for Name, set it's type, id and name attribute,
#  #and append it to <li> element
#  inputFilename = document.createElement('INPUT')
#  inputFilename.setAttribute 'type', 'text'
#  inputFilename.setAttribute 'name', nameAttrFilename
#  inputFilename.setAttribute 'id', idAttrFilename
#  inputFilename.setAttribute 'class', 'form-control'
#  inputFilename.setAttribute 'placeholder', 'Filename'
#  divFilename.appendChild inputFilename
#  #create label for Contents, set it's for attribute,
#  #and append it to <li> element
#  labelContents = document.createElement('label')
#  labelContents.setAttribute 'for', idAttrContents
#  labelContents.setAttribute 'class', 'sr-only'
#  contentsLabelText = document.createTextNode('Contents')
#  labelContents.appendChild contentsLabelText
#  divContents.appendChild labelContents
##  divContents.appendChild(document.createElement('br'))
#  #create input for Contents, set it's type, id and name attribute,
#  #and append it to <li> element
#  inputContents = document.createElement('TEXTAREA')
##  inputContents.setAttribute 'type', 'text'
#  inputContents.setAttribute 'name', nameAttrContents
#  inputContents.setAttribute 'id', idAttrContents
#  inputContents.setAttribute 'rows', 10
#  inputContents.setAttribute 'class', 'form-control'
#  inputContents.setAttribute 'placeholder', 'File contents...'
#  divContents.appendChild inputContents
#
##  li.appendChild divFilename
##  li.appendChild divContents
#  #add created <li> element with its child elements
#  #(label and input) to myList (<ul>) element
#  divGroup.appendChild divFilename
#  divGroup.appendChild divContents
#  divGroup.appendChild divDelBtn
#  document.getElementById('gFiles').appendChild divGroup
#
#  # if g_file.count > 1
#    # if first g_file doesnt have delete, add it
#  # else
#    # if first g+file has delete, remove it
#  console.log("Num gfiles " + numGFiles())
#
#  updateGFileDeletes()
#
##  document.getElementById('gFiles').appendChild divContents
#  #show address header
##  $('#gFilesHeader').show()
#  return