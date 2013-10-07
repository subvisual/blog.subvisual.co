require 'spec_helper'

describe User do

  context "#has_twitter?" do
    it "is false if user doesn't have twitter" do
      user = build :user, twitter_handle: ""

      user.has_twitter?.should be_false
    end
  end
end
