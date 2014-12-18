require 'spec_helper'

RSpec.describe API::PostsController, type: :controller do
  it 'creates a post with the correct params' do
    new_post = spy('post')
    allow(Post).to receive(:new).and_return(new_post)
    post_params = { category_id: '1', title: 'A post', body: "# Post\n With markdown", author_id: '1' }

    post :create, post: post_params

    expect(Post).to have_received(:new).with(post_params)
    expect(new_post).to have_received(:save)
  end
end
