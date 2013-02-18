# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


# How we'll grab the location data from json
returned = {}

result = []

locationAjax = ->
  $.ajax
    url: "locationjson.json"
    data: "id=2"
    type: "GET"
    contentType: "application/json"
    dataType: "json"
    success: (data) ->
      returned = data
    complete: ->
      result = returned


locationAjax()
