class Post < ActiveRecord::Base

  belongs_to :author, class_name: 'User'
  belongs_to :category

  validates :author,
            :body,
            :category,
            :title,
            presence: true

  def self.published
    self.where("published_at IS NOT NULL")
  end

  def published?
    published_at.present?
  end

end
