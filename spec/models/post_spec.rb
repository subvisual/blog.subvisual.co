require "spec_helper"

RSpec.describe Post, type: :model do
  context "#to_param" do
    it "starts with the post id" do
      post = create(:post)

      param = post.to_param

      expect(param).to match(/^#{post.id}/)
    end
  end

  context "#title" do
    it "returns a sanitized title without HTML tags" do
      post = Post.new(title: "Title<br> with tags")

      expect(post.title).to eq("Title with tags")
    end
  end

  context "#raw_title" do
    it "returns the raw title, with HTML tags" do
      post = Post.new(title: "Title<br> with tags")

      expect(post.raw_title).to eq("Title<br> with tags")
    end
  end

  context ".published" do
    it "returns only posts that are published" do
      create_list(:post, 2)
      published_posts = create_list(:published_post, 2)

      Post.published.should match_array(published_posts)
    end
  end

  context "#valid?" do
    it "is false if post has main headings" do
      post = build :post, body: "# title"

      expect(post).not_to be_valid
    end
  end

  context "#published?" do
    it "returns false for an unpublished post" do
      post = create :post

      post.should_not be_published
    end

    it "returns false for an unpublished post" do
      post = create :published_post

      post.should be_published
    end
  end

  context "::MAIN_HEADING_REGEX" do
    it "catches posts with main heading tags" do
      post = build :post, body: "# title"

      match = post.body.match(Post::MAIN_HEADING_REGEX)

      expect(match).to be
    end

    it "catches posts with main headings not on the first line" do
      post = build :post, body: "text\n\n# title"

      match = post.body.match(Post::MAIN_HEADING_REGEX)

      expect(match).to be
    end

    it "does not catch posts with secondary headings" do
      post = build :post, body: "## title"

      match = post.body.match(Post::MAIN_HEADING_REGEX)

      expect(match).not_to be
    end
  end
end
