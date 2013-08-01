require 'spec_helper'

describe PostPresenter do

  context "#publish_date" do
    it "returns nothing if post is not published" do
      post_presenter = PostPresenter.new(build(:post), view)

      post_presenter.publish_date.should be_nil
    end
  end

end
