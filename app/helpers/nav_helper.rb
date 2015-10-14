module NavHelper
  def nav_item(text, url, options = {})
    generic_nav_item('Nav-item', options) do
      nav_link(text, url, 'Nav-link')
    end
  end

  def nav_overlay_item(text, url, options = {})
    generic_nav_item('NavOverlay-item', options) do
      nav_link(text, url, 'NavOverlay-link')
    end
  end

  def generic_nav_item(css_class, options)
    (options[:class] ||= '') << " #{css_class}"

    content_tag :li, options do
      yield if block_given?
    end
  end

  def nav_link(text, url, css_class)
    link_to text, url, class: css_class
  end
end
