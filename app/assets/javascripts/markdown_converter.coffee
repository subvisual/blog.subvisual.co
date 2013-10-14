class window.MarkdownConverter
  showdown:  undefined
  src:       undefined
  dst:       undefined
  input:     undefined
  output:    undefined

  constructor: (@src, @dst) ->
    @showdown = new Showdown.converter({ extensions: [] })
    @listen()

  convert: ->
    input = @src.val()
    @output = $(@showdown.makeHtml(input))

  display: ->
    @dst.html(@output)

  listen: ->
    @src.on 'keyup', (event) =>
      @convert()
      @display()
    @src.trigger 'keyup'

