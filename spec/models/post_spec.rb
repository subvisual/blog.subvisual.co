require 'spec_helper'

describe Post do

  context '.all_published' do
    it 'returns only posts that are published' do
      unpublished_posts = create_list(:post, 2)
      published_posts   = create_list(:published_post, 2)

      Post.all_published.should match_array(published_posts)
    end
  end

  context '.by_category' do
    it 'returns only posts from the given category' do
      red_category = create :category, name: :red
      green_category = create :category, name: :green
      red_posts   = create_list(:post, 2, category: red_category)
      green_posts = create_list(:post, 2, category: green_category)
      all_posts = red_posts + green_posts

      Post.by_category(red_category).should =~ red_posts
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
