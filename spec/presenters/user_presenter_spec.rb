require 'spec_helper'

describe UserPresenter do

  context "#photo" do
    it "return an image tag based on user first name" do
      user_presenter = UserPresenter.new(build(:user, first_name: :dummy), view)

      user_presenter.photo.should include 'dummy.png'
    end
  end
end
