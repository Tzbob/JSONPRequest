exportModule = (root, name, factory) ->
  if typeof define is "function" and define.amd
    define [], factory
  else
    root[name] = factory()

exportModule window, "JSONPRequest", ->
  window.callbackbuffer = {}

  class JSONPRequest
    constructor: (@url) ->
      if @url.indexOf "?" < 0
        @url += "?"
      else
        @url += "&"

    send: (callback) ->
      @generateScript @generateCallback callback
      head = document.getElementsByTagName("head")[0]
      head.appendChild @script
    
    generateCallback: (callback) ->
      chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz$_"
      exportedName = ""

      for i in [0..15]
        exportedName += chars.charAt Math.floor Math.random() * chars.length

      window.callbackbuffer[exportedName] = (json) =>
        callback json
        delete window.callbackbuffer[exportedName]
        @script.parentNode.removeChild @script

      exportedName

    generateScript: (exportedName) ->
      @script = document.createElement "script"
      @script.src = "#{@url}&callback=window.callbackbuffer.#{exportedName}"
