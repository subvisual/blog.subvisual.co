innerHtmlToString = (node, indent) ->
  html = ""
  type = node.nodeType
  if type is Node.ELEMENT_NODE
    html += indent + "<" + node.tagName.toLowerCase()
    attributes = node.attributes
    unless null is attributes
      countAttrs = attributes.length
      index = 0
      while index < countAttrs
        att = attributes[index]
        unless null is att
          html += " "
          html += att.name + "='" + att.value + "'"
        index++
    html += ">"
    if node.hasChildNodes
      children = node.childNodes
      length = children.length
      count = 0
      while count < length
        child = children[count]
        html += "\n" + innerHtmlToString(child, indent + "  ")
        count++
    html += "\n" + indent + "</" + node.tagName.toLowerCase() + ">"
  else html += indent + node.data  if type is Node.TEXT_NODE
  html

htmlToString = (node) ->
  $.map($(node).children(), (node) ->
    innerHtmlToString(node, '')
  ).join('\n')


initialize = ->
  $('.example').each ->
    code = $('<pre class="language-markup"><code></code></pre>')
    code.hide()

    $(this).after(code)
    button = $('<a href="#">&gt; source</a>')
    $(this).after(button)

    code.find('code').text(htmlToString(this))

    button.on 'click', (event) =>
      event.preventDefault()
      code.slideToggle(200)

window.gb_blog ||= {}
window.gb_blog.ui_kit = initialize
