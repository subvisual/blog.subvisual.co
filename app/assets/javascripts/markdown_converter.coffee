#= require showdown
#= require showdown/github
#= require showdown/twitter
#= require showdown/table
#= require showdown/prettify

class window.MarkdownConverter
  showdown:  undefined
  src:       undefined
  dst:       undefined
  input:     undefined
  output:    undefined

  constructor: (@src, @dst) ->
    @showdown = new Showdown.converter({ extensions: ['github', 'twitter', 'table', 'prettify'] })
    @listen()

  listen: ->
    @src.on 'keyup', (event) =>
      @convert()
      @display()
    @src.trigger 'keyup'

  convert: ->
    input = @src.val()
    @output = @showdown.makeHtml(input)

  display: ->
    @dst.html(@output)
