class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts, foreign_key: :author_id

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    self.first_name, self.last_name = name.split(' ', 2)
  end

  def self.from_full_name(name)
    first_name, last_name = name.split(' ')
    where('first_name ILIKE ? and last_name ILIKE ?', "%#{first_name}%", "%#{last_name}%").first
  end
end
