class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts, foreign_key: :author_id

  def name
    "#{first_name} #{last_name}".strip
  end

  def full_name
    name
  end
end
