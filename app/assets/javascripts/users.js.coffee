# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@updateCSS = (selector, styles) ->
  for sheet in document.styleSheets
      for rule in sheet.cssRules || sheet.rules || []
        if rule.selectorText == selector
          for style, value of styles
            rule.style[style] = value

jQuery(document).ready ->
  jQuery(".expandable-content").hide()
  #toggle the component with class content
  jQuery(".expandable-heading").click ->
    jQuery(this).next(".expandable-content").slideToggle 500