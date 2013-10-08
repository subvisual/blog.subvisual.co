describe window.MarkdownConverter, ->

  beforeEach ->
    fixture = $('<div id="fixture" style=""> <textarea id="input"></textarea> <div id="output"></div> </div>')
    $('body').append(fixture)
    @converter = new MarkdownConverter $('#input'), $('#output')

  afterEach ->
    $('#fixture').remove()

  describe '#constructor', ->
    it 'finds the source', ->
      expect(@converter.src).toBe('textarea')

    it 'finds the destination', ->
      expect(@converter.dst).toBe('div')


  describe '#convert', ->
    it 'converts markdown titles', ->
      set_input '# title'
      expect(@converter.convert()).toBe 'h1'

    describe 'twitter extension', ->
      it 'converts twitter handles to urls', ->
        set_input '@naps62'
        expect(@converter.convert()).toContain 'a[href="http://twitter.com/naps62"]'

    describe 'github extension', ->
      it 'handles deleted text', ->
        set_input '~~deleted text~~'
        expect(@converter.convert()).toContain 'del'

    describe 'table extension', ->
      it 'handles tables', ->
        set_input '|col1|col2|\n|===|===|'
        expect(@converter.convert()).toBe 'table'


  describe '#display', ->
    it 'shows the output', ->
      set_input 'foo bar'
      @converter.convert()
      @converter.display()
      expect($('#output')).toHaveText('foo bar')

  describe '#listen', ->
    it 'listen to changes and updates output', ->
      set_input 'foo bar'
      $('#input').trigger($.Event('keyup'))
      expect($('#output')).toHaveText('foo bar')

set_input = (input) ->
  $('#input').val(input)
