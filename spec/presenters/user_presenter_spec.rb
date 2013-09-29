require 'spec_helper'
require 'uri'

describe UserPresenter do

  context "#photo" do
    it "returns an image tag based on user first name" do
      user_presenter = UserPresenter.new(build(:user, first_name: :dummy), view)

      user_presenter.photo.should include 'dummy.png'
    end
  end

  context "#twitter_url" do
    it "gives a correct twitter url" do
      user_presenter = UserPresenter.new(build(:user), view)

      user_presenter.twitter_url.should match URI::regexp
    end
  end
end
