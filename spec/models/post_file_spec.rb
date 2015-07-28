require 'spec_helper'

describe PostFile do

  def mock_post_file(date: nil)
    filename = 'tmp/fake-post.md'
    author = create(:user)
    content = <<-eof.gsub(/^ +/, '')
      ---
      title: This is the post title
      author: #{author.name}
      tags: General, Development
      ---

      # A title

      A paragraph
    eof

    File.open(filename, 'w') { |f| f.write(content) }
    filename
  end

  context '#data' do
    it 'includes the post title' do
      post_file = PostFile.import(mock_post_file)

      title = post_file.data[:title]

      expect(title).to eq('This is the post title')
    end

    it 'finds the correct author' do
      post_file = PostFile.import(mock_post_file)

      author = post_file.data[:author]

      expect(author).to be_a(User)
    end

    it 'includes the correct content' do
      post_file = PostFile.import(mock_post_file)

      content = post_file.data[:content]

      expect(content).to include('# A title')
      expect(content).to include('A paragraph')
    end
  end

  context '#body' do
    it 'does not include yaml front matter' do
      post_file = PostFile.import(mock_post_file)

      body = post_file.body

      expect(body).not_to include('---')
      expect(body).not_to include('This is the post title')
    end
  end
end
