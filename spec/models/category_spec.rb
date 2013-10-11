require 'spec_helper'

describe Category do

  context '.find_by_name' do
    it 'is case insensitive' do
      category = create :category, name: 'FooBar'

      Category.find_by_name('foobar').should eq category
    end
  end
end
