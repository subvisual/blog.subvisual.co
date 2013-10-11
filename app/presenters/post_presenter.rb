class PostPresenter < RailsPresenter::Base

  present :category, :author

  def self.model_name
    Post.model_name
  end

  def publish_date
    format_date(published_at) if published?
  end

  def creation_date
    format_date(created_at)
  end

  def update_date
    format_date(updated_at, :timestamp)
  end

  def info
    h.raw(
      if published?
        "Writen by #{author_link} on #{publish_date}"
      elsif persisted?
        "Being drafted by #{author_link} since #{creation_date} (last updated at #{update_date})"
      else
        "Being drafter by #{author_link} (never saved)"
      end
    )
  end

  def author_link
    h.link_to author.first_name, '#'
  end

  def author_photo
    author.photo
  end

  def body
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    rendered_post = renderer.render(super)
    h.raw(rendered_post)
  end

  def form_method
    if persisted?
      :patch
    else
      :post
    end
  end


  private

  def format_date(date, format = :publish_date)
    h.l(date, format: format)
  end

end
