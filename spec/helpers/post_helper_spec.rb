require "spec_helper"

RSpec.describe PostHelper, type: :helper do
  context '#post_description' do
    it "returns the body without html tags" do
      post = create(:post, body: '# title')

      helper.post_description(post).should eq "title"
    end

    it "removes new lines" do
      post = create(:post, body: "title.\n\ntext")

      helper.post_description(post).should eq "title. text"
    end
  end

  context '#post_form_method' do
    it "uses POST for new records" do
      post = build(:post)

      helper.post_form_method(post).should eq :post
    end

    it "uses PATCH for new records" do
      post = create(:post)

      helper.post_form_method(post).should eq :patch
    end
  end
end
