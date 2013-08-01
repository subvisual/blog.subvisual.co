class User < ActiveRecord::Base
  include Clearance::User

  has_many :posts, as: :author

end
