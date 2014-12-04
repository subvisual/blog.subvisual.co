class Saying < ActiveRecord::Base
  def self.current
    last order: 'created_at DESC', limit: 1
  end
end
