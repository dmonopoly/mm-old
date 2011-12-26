# Implementation of Application.Misc.Flash class
jQuery ->

@module "Application.Misc", ->
  class @Flash
    setFlashToggle: ->
      $("#flashes").delay(2000).fadeOut() # number of milliseconds