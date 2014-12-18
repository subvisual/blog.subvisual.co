class Saying < ActiveRecord::Base
  def self.current
    order('created_at DESC').limit(1).last
  end
end
