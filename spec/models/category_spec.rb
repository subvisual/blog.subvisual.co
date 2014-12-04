require 'spec_helper'

RSpec.describe Category, type: :model do

  context '.find_by_name' do
    it 'is case insensitive' do
      category = create :category, name: 'FooBar'

      Category.find_by_name('foobar').should eq category
    end
  end
end
