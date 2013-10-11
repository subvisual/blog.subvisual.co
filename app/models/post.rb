class Post < ActiveRecord::Base

  belongs_to :author, class_name: 'User'
  belongs_to :category

  validates :author,
            :body,
            :category,
            :title,
            presence: true

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

end
