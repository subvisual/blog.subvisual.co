require 'spec_helper'

RSpec.describe Post, type: :model do
  context '#to_param' do
    it 'starts with the post id' do
      post = create(:post)

      param = post.to_param

      expect(param).to match(/^#{post.id}/)
    end
  end

  context '.published' do
    it 'returns only posts that are published' do
      create_list(:post, 2)
      published_posts   = create_list(:published_post, 2)

      Post.published.should match_array(published_posts)
    end
  end

  context '#published?' do
    it 'returns false for an unpublished post' do
      post = create :post

      post.should_not be_published
    end

    it 'returns false for an unpublished post' do
      post = create :published_post

      post.should be_published
    end
  end
end
