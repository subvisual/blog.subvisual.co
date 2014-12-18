require 'spec_helper'

RSpec.describe User, type: :model do

  context '#twitter_handle?' do
    it "is false if user doesn't have twitter" do
      user = build :user, twitter_handle: ''

      expect(user).not_to have_twitter
    end
  end
end
