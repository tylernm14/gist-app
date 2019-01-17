# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
addGFileField = ->
#create Date object
  date = new Date
  #get number of milliseconds since midnight Jan 1, 1970
  #and use it for address key
  mSec = date.getTime()
  #Replace 0 with milliseconds
  idAttrName = 'gist_g_files_attributes_0_name'.replace('0', mSec)
  nameAttrName = 'gist[g_files_attributes[0][name]'.replace('0', mSec)
  idAttrContents = 'gist_g_files_attributes_0_contents'.replace('0', mSec)
  nameAttrContents = 'gist[g_files_attributes][0][contents]'.replace('0', mSec)
  #create <li> tag
  li = document.createElement('li')
  #create label for Name, set it's for attribute,
  #and append it to <li> element
  labelName = document.createElement('label')
  labelName.setAttribute 'for', idAttrName
  nameLabelText = document.createTextNode('Name')
  labelName.appendChild nameLabelText
  li.appendChild labelName
  #create input for Name, set it's type, id and name attribute,
  #and append it to <li> element
  inputName = document.createElement('INPUT')
  inputName.setAttribute 'type', 'text'
  inputName.setAttribute 'id', idAttrName
  inputName.setAttribute 'name', nameAttrName
  li.appendChild inputName
  #create label for Contents, set it's for attribute,
  #and append it to <li> element
  labelContents = document.createElement('label')
  labelContents.setAttribute 'for', idAttrContents
  contentsLabelText = document.createTextNode('Contents')
  labelContents.appendChild contentsLabelText
  li.appendChild labelContents
  #create input for Contents, set it's type, id and name attribute,
  #and append it to <li> element
  inputContents = document.createElement('INPUT')
  inputContents.setAttribute 'type', 'text'
  inputContents.setAttribute 'id', idAttrContents
  inputContents.setAttribute 'name', nameAttrContents
  li.appendChild inputContents
  #add created <li> element with its child elements
  #(label and input) to myList (<ul>) element
  document.getElementById('gFilesList').appendChild li
  #show address header
#  $('#gFilesHeader').show()
  return