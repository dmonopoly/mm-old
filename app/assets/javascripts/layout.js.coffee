# Layout file for the other coffeescript files.
# Defines general structure of modules and classes.

@module "Application", ->
  @module "Memory", ->
    class @Form # so you can do formHelper = new Application.Memory.Form
      info: "prepareGhostArea(), updateGhostAreaOnKeyUp()"

  # not used...
  @module "TimeFrame", ->
    class @Timeline
      info: "draw()"
  
      # Triggers for superadmin users list:
      # Superadmin
      # $("#manager_list_trigger").click ->
      #   $("#superadmins_list").toggle()
      #