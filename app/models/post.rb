class Post < ActiveRecord::Base
  POSTS_LIMIT = 10
  MIN_INTRO_SIZE = 140
  PRIMARY_TAGS = %i(development design community general)
  MAIN_HEADING_REGEX = /^#[^#]/

  include PgSearch
  multisearchable(
    against: %i(title processed_body author_name tags),
    if: :published?,
    order_within_rank: "posts.published_at DESC",
  )

  include ActionView::Helpers::SanitizeHelper

  default_scope { order("published_at DESC") }

  belongs_to :author, class_name: "User"
  belongs_to :category
  has_one :hero
  acts_as_taggable

  accepts_nested_attributes_for :hero

  validates :author_id, :body, :title, presence: true
  validate :ensure_primary_tag_exists
  validate :ensure_no_primary_heading_exists

  after_validation :preprocess
  before_save :set_extra_tags

  delegate :name, to: :author, prefix: true

  scope :published, -> { where("published_at IS NOT NULL") }
  scope :unpublished, -> { where("published_at IS NULL") }
  scope :recent, -> { limit(POSTS_LIMIT) }
  scope :by_author, ->(author) { published.where(author_id: author) }

  def to_param
    "#{id} #{title}".parameterize
  end

  def title
    sanitize(read_attribute(:title), tags: [])
  end

  def raw_title
    read_attribute(:title)
  end

  def published?
    published_at.present?
  end

  def preprocess
    return if errors.any?

    Services::PostProcessor.new(self).process
  end

  def related_by_author
    author.posts.published.where("id != ?", id).sample
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

  def hero?
    hero && hero.image_url.present?
  end

  def hero_url
    hero.try(:image, :url)
  end

  def self.sorted_published_tags
    all_tags.
      select { |tag| Post.published.tagged_with(tag).any? }.
      sort_by { |tag| Post::PRIMARY_TAGS.include?(tag.name.to_sym) ? 0 : 1 }
  end

  private

  def set_extra_tags
    tag_list.remove(secondary_tags)
    tag_list.add(extra_tags, parse: true)
  end

  def ensure_primary_tag_exists
    return if primary_tag?

    errors.add(:tags, "must include at least one primary tag")
  end

  def ensure_no_primary_heading_exists
    return unless body =~ MAIN_HEADING_REGEX

    errors.add(:body, "cannot have main headings")
  end
end
