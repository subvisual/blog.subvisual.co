class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts, foreign_key: :author_id

  before_create :reset_password!

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    self.first_name, self.last_name = name.split(' ', 2)
  end

  def reset_password!
    require 'securerandom'
    self.password = SecureRandom.hex(8)
  end
end
