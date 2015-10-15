require 'spec_helper'

RSpec.describe NavHelper, type: :helper do
  context '#nav_item' do
    it 'creates a link inside a list item' do
      result = helper.nav_item('text', 'url')

      expect(result).to have_css('li > a')
    end
  end

  context '#nav_overlay_item' do
    it 'creates a link inside a list item' do
      result = helper.nav_overlay_item('text', 'url')

      expect(result).to have_css('li > a')
    end
  end
end
