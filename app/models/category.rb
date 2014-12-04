class Category < ActiveRecord::Base
  has_many :posts

  validates :name, presence: true

  def self.from_param(param)
    find_by_name(param.titleize)
  end

  def to_param
    name.parameterize
  end

  def self.find_by_name(name)
    where('lower(name) = ?', name.downcase).first
  end
end
