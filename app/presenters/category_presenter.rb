class CategoryPresenter < RailsPresenter::Base

  def name_with_icon
    h.content_tag :span do
      h.raw([
        icon,
        h.content_tag(:span, name, class: :name)
        ].join)
    end
  end

  def icon
    h.image_tag image
  end

  def image
    h.image_path("icons/#{to_param}.png")
  end
end
