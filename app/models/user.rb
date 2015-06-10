class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts, as: :author

  def name
    "#{first_name} #{last_name}".strip
  end

  def full_name
    name
  end
end
