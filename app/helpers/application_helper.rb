module ApplicationHelper
  def nav_item(text, url, options = {})
    generic_nav_link(text, url, 'Nav-link', 'Nav-item', options)
  end

  def nav_overlay_item(text, url, options = {})
    generic_nav_link(text, url, 'NavOverlay-link', 'NavOverlay-item', options)
  end

  def generic_nav_link(text, url, item_class, link_class, options = {})
    options[:class] ||= ''
    options[:class] << " #{link_class}"

    content_tag :li, options do
      link_to text, url, class: item_class
    end
  end
end
