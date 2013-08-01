class CategoryPresenter < RailsPresenter::Base

  def name_with_icon
    h.content_tag :span do
      h.raw([ h.image_tag(h.image_path "icons/#{name.downcase}"),
        h.content_tag(:span, name, class: :name)
        ].join)
    end
  end
end
