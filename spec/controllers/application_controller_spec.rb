require 'spec_helper'

RSpec.describe ApplicationController, type: :controller do
  context '#admin_controller' do
    it 'is false' do
      expect(controller.admin_controller?).not_to be
    end
  end

  context '#all_tags' do
    before(:all) do
      FileUtils.mkdir_p(Rails.root.join('tmp', 'cache'))
    end

    before(:each) do
      Rails.cache.clear
    end

    it 'memoizes the value within the same request' do
      create :published_post, tag_list: [:development, :tag1]

      first_tag_list = controller.all_tags
      create :published_post, tag_list: [:design, :tag2]
      second_tag_list = controller.all_tags

      expect(first_tag_list).to eq(second_tag_list)
    end

    it 'refreshes the value if the cache is deleted' do
      create :published_post, tag_list: [:development, :tag1]

      first_tag_list = controller.all_tags
      create :published_post, tag_list: [:design, :tag2]
      Rails.cache.clear
      second_tag_list = controller.all_tags

      expect(first_tag_list).not_to eq(second_tag_list)
    end
  end
end
