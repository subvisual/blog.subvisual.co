class Post < ActiveRecord::Base
  default_scope  { order('published_at DESC') }

  belongs_to :author, class_name: 'User'
  belongs_to :category

  validates :author_id, :body, :category_id, :title, presence: true

  before_validation :preprocess

  delegate :name, to: :author, prefix: true

  def self.all_published
    where('published_at IS NOT NULL')
  end

  def self.by_category(category)
    all_published.where(category_id: category)
  end

  def self.by_author(author)
    all_published.where(author_id: author)
  end

  def self.visible_by(author)
    table = arel_table
    where(table[:published_at].not_eq(nil).
          or(table[:author_id].eq(author.id)))
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
