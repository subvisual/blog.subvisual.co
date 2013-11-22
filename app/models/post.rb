class Post < ActiveRecord::Base

  default_scope  { order('published_at DESC') }

  belongs_to :author, class_name: 'User'
  belongs_to :category

  validates :author,
            :body,
            :category,
            :title,
            presence: true

  before_validation :preprocess

  def self.all_published
    self.where("published_at IS NOT NULL")
  end

  def self.by_category(category)
    all_published.where(category_id: category)
  end

  def self.visible_by(author)
    table = arel_table
    where(table[:published_at].not_eq(nil)
          .or(table[:author_id].eq(author.id)))
  end

  def to_param
    "#{id} #{title}".parameterize
  end

  def published?
    published_at.present?
  end

  def preprocess
    Services::PostProcessor.new(self).process
  end

end
