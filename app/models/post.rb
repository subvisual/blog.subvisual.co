class Post < ActiveRecord::Base
  POSTS_LIMIT = 10
  MIN_INTRO_SIZE = 140

  default_scope  { order('published_at DESC') }

  belongs_to :author, class_name: 'User'
  belongs_to :category
  acts_as_taggable

  validates :author_id, :body, :title, presence: true

  before_validation :preprocess

  delegate :name, to: :author, prefix: true

  def self.published
    where('published_at IS NOT NULL')
  end

  def self.recent
    limit(POSTS_LIMIT)
  end

  def self.by_author(author)
    published.where(author_id: author)
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
