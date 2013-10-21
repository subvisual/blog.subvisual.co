class Post < ActiveRecord::Base

  default_scope order('published_at DESC')

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
    self.where(category_id: category)
  end

  def to_param
    "#{id}-#{title}".parameterize
  end

  def published?
    published_at.present?
  end

  def preprocess
    Services::PostProcessor.new(self).process
  end

end
