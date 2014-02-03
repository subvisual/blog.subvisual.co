require 'spec_helper'
require 'uri'

describe UserDecorator do

  context "#full_name" do
    it "strips leading or trailing whitespace" do
      user_decorator = build(:user, first_name: ' first', last_name: 'last ').decorate

      user_decorator.full_name.should eq 'first last'
    end
  end

  context "#photo" do
    it "returns an image tag based on user first name" do
      user_decorator = build(:user, first_name: :foo, last_name: :bar).decorate

      user_decorator.photo_url.should include 'foo-bar.png'
    end
  end

  context "#twitter_url" do
    it "gives a correct twitter url" do
      user_decorator = build(:user).decorate

      user_decorator.twitter_url.should match URI::regexp
    end
  end
end
