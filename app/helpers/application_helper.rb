module ApplicationHelper

  def nav_item(text, url, options = {})
    options[:class] ||= ''
    options[:class] << ' Nav-item'

    content_tag :li, options do
      link_to text, url, class: 'Nav-link'
    end
  end

  def nav_overlay_item(text, url, options = {})
    options[:class] ||= ''
    options[:class] << ' NavOverlay-item'

    content_tag :li, options do
      link_to text, url, class: 'NavOverlay-link'
    end
  end
end
