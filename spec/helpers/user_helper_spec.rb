require "spec_helper"

RSpec.describe UserHelper, type: :helper do
  context '#user_photo_path' do
    it "returns an image tag based on user first name" do
      user = build(:user, first_name: :foo, last_name: :bar)

      helper.user_photo_path(user).should include "foo-bar.png"
    end

    it "includes an option suffix" do
      user = build(:user)

      helper.user_photo_path(user, "suffix").should include "suffix"
    end
  end
end
