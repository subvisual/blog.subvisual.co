require 'spec_helper'

describe Services::PostProcessor do

  context '#process' do

    it 'sets the processed body of a post' do
      post = build :post, processed_body: nil

      Services::PostProcessor.new(post).process

      post.processed_body.should_not be_nil
    end

    it 'parses markdown' do
      post = build :post, body: '# title'

      Services::PostProcessor.new(post).process

      post.processed_body.should have_tag 'h1'
    end

    it 'handles syntax highlighting' do
      post = build :post, body: markdown_code_block

      Services::PostProcessor.new(post).process

      post.processed_body.should have_tag('div', with: { class: 'highlight' })
    end
  end
end

def markdown_code_block
"""
```ruby
def x
end
```
"""
end
