require "spec_helper"

RSpec.describe Services::PostProcessor do
  context "#process" do
    it "sets the processed body of a post" do
      post = build :post, processed_body: nil

      Services::PostProcessor.new(post).process

      post.processed_body.should_not be_nil
    end

    it "parses markdown" do
      post = build :post, body: "# title"

      Services::PostProcessor.new(post).process

      post.processed_body.should have_tag "h1"
    end

    it "parses the first paragraph" do
      post = build :post, body: "First\r\n\r\nSecond"

      Services::PostProcessor.new(post).process

      post.processed_intro.should include "First"
      post.processed_intro.should_not include "Second"
    end

    it "handles syntax highlighting" do
      post = build :post, body: markdown_code_block

      Services::PostProcessor.new(post).process

      post.processed_body.should have_tag("pre", with: { class: "highlight" })
    end

    it "creates links targeting a new browser tab" do
      post = build :post, body: markdown_code_block

      Services::PostProcessor.new(post).process

      post.processed_body.should have_tag("a", with: { target: "_blank", href: "link" })
    end

    it "wraps the generated table in a PostTable component" do
      post = build :post, body: markdown_table

      Services::PostProcessor.new(post).process

      post.processed_body.should have_tag("table")
      post.processed_body.should have_tag("div", with: { class: "PostTable" })
    end
  end
end

# rubocop:disable Lint/ImplicitStringConcatenation
def markdown_code_block
  ""'
```ruby
def x
end
```

[text](link)
  '""
end

def markdown_table
  ""'
|   | A |
|---|---|
| 1 | x |
| 2 | o |
  '""
end
# rubocop:enable Lint/ImplicitStringConcatenation
