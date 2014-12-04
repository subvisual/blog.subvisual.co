class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts, as: :author

  def twitter_handle?
    twitter_handle.present?
  end

  def name
    "#{first_name} #{last_name}"
  end
end
