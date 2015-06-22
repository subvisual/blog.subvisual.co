require 'elasticsearch/model'

class Post < ActiveRecord::Base
  POSTS_LIMIT = 10
  MIN_INTRO_SIZE = 140
  PRIMARY_TAGS = %i(development design community general)

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name [Rails.env, model_name.collection.gsub(%r{/}, '-')].join('_')

  default_scope  { order('published_at DESC') }

  belongs_to :author, class_name: 'User'
  belongs_to :category
  acts_as_taggable

  validates :author_id, :body, :title, presence: true
  validate :ensure_primary_tag_exists

  after_validation :preprocess
  before_save :set_extra_tags

  delegate :name, to: :author, prefix: true

  scope :published, -> { where('published_at IS NOT NULL') }
  scope :unpublished, -> { where('published_at IS NULL') }
  scope :recent, -> { limit(POSTS_LIMIT) }
  scope :by_author, ->(author) { published.where(author_id: author) }

  def to_param
    "#{id} #{title}".parameterize
  end

  def published?
    published_at.present?
  end

  def preprocess
    return if errors.any?

    Services::PostProcessor.new(self).process
  end

  def publication_year
    published_at.year
  end

  def related_by_author
    author.posts.published.where('id != ?', id).sample
  end

  def related_by_tags
    find_related_tags.published.limit(3).sample
  end

  attr_accessor :extra_tags

  def secondary_tags
    tag_list.reject { |tag| PRIMARY_TAGS.include?(tag.to_sym) }
  end

  def primary_tag?
    tag_list.any? { |tag| PRIMARY_TAGS.include?(tag.to_sym) }
  end

  private

  def set_extra_tags
    tag_list.remove(secondary_tags)
    tag_list.add(extra_tags, parse: true)
  end

  def ensure_primary_tag_exists
    return if primary_tag?

    errors.add(:tags, 'must include at least one primary tag')
  end
end
