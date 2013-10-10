class Category < ActiveRecord::Base

  has_many :posts

  validates :name, presence: true

  def self.find_by_name(name)
    where('lower(name) = ?', name.downcase)
  end

end
