require 'spec_helper'

RSpec.describe User, type: :model do
  context '#twitter_handle?' do
    it "is false if user doesn't have twitter" do
      user = build :user, twitter_handle: ''

      expect(user.twitter_handle?).not_to be
    end
  end
end
