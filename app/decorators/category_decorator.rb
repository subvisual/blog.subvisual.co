class CategoryDecorator < Draper::Decorator
  decorates_association :posts
  delegate :name, :id

  def name_with_icon
    h.content_tag :span do
      h.raw([
        icon,
        h.content_tag(:span, name, class: :name)
      ].join)
    end
  end

  def image
    h.image_path("icons/#{to_param}.png")
  end

  def icon
    h.image_tag image, alt: name
  end
end
