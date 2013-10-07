require 'spec_helper'
require 'uri'

describe UserPresenter do

  context "#full_name" do
    it "strips leading or trailing whitespace" do
      user_presenter = UserPresenter.new(build(:user, first_name: ' first', last_name: 'last '), view)

      user_presenter.full_name.should eq 'first last'
    end
  end

  context "#photo" do
    it "returns an image tag based on user first name" do
      user_presenter = UserPresenter.new(build(:user, first_name: :foo, last_name: :bar), view)

      user_presenter.photo.should include 'foo_bar.png'
    end
  end

  context "#twitter_url" do
    it "gives a correct twitter url" do
      user_presenter = UserPresenter.new(build(:user), view)

      user_presenter.twitter_url.should match URI::regexp
    end
  end
end
