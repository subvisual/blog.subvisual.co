class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts, foreign_key: :author_id

  def name
    "#{first_name} #{last_name}".strip
  end

  def full_name
    name
  end

  def name=(name)
    self.first_name, self.last_name = name.split(' ', 2)
  end
end
