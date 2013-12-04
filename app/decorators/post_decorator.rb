class PostDecorator < Draper::Decorator
  decorates_association :category
  decorates_association :author
  delegate :title, :published?, :published_at, :created_at, :updated_at, :persisted?, :id

  def page_title
    "#{title}, by #{author.full_name} of Group Buddies"
  end

  def publish_date
    format_date(published_at) if published?
  end

  def short_publish_date
    format_date(published_at, :short_month_and_day) if published?
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
        "Written by #{author_link} on #{publish_date}"
      elsif persisted?
        "Being drafted by #{author_link} since #{creation_date} (last updated at #{update_date})"
      else
        "Being drafted by #{author_link} (never saved)"
      end
    )
  end

  def author_link
    h.link_to author.first_name, h.archive_path(author: author.first_name)
  end

  def author_photo
    author.photo
  end

  def processed_body
    h.raw(object.processed_body)
  end

  def description
    h.strip_tags(object.processed_body).gsub(/\n+/, ' ')[0...150].strip
  end

  def new?
    !persisted?
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
