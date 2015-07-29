class PostDecorator < Draper::Decorator
  decorates_association :category
  decorates_association :author
  delegate :title, :published?, :published_at, :created_at, :updated_at, :persisted?, :id, :tag_list, :related_by_author, :related_by_tags, :secondary_tags, :hero, :hero?

  def page_title
    "#{title}, by #{author.name} of Subvisual"
  end

  def twitter_title
    "#{title}, by @#{author.twitter_handle} of @subvisual"
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

  def author_photo
    author.photo
  end

  def processed_body
    h.raw(object.processed_body)
  end

  def processed_intro
    h.raw(object.processed_intro)
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
