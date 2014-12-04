require 'spec_helper'

RSpec.describe PostDecorator do

  context '#publish_date' do
    it 'returns nothing if post is not published' do
      post_decorator = build(:post).decorate

      post_decorator.publish_date.should be_nil
    end
  end

  context '#form_method' do
    it 'uses POST for new records' do
      post_decorator = build(:post).decorate

      post_decorator.form_method.should eq :post
    end

    it 'uses PATCH for new records' do
      post_decorator = create(:post).decorate

      post_decorator.form_method.should eq :patch
    end
  end

  context '#description' do
    it 'returns the body without html tags' do
      post_decorator = create(:post, body: '# title').decorate

      post_decorator.description.should eq 'title'
    end

    it 'removes new lines' do
      post_decorator = create(:post, body: "title.\n\ntext").decorate

      post_decorator.description.should eq 'title. text'
    end
  end

end
