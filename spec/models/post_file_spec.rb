require 'spec_helper'

describe PostFile do

  def mock_post_file(mtime: nil, title: nil, author: nil, body: nil, tags: nil)
    filename = 'tmp/fake-post.md'
    author ||= create(:user)
    mtime ||= Time.now
    title ||= "This is the post title"
    tags ||= "General, Development"
    body ||= <<-eof.gsub(/^ +/, '')
      # A title

      A paragraph
    eof

    full_content ||= <<-eof.gsub(/^ +/, '')
      ---
      title: #{title}
      author: #{author.name}
      tags: #{tags}
      ---
      #{body}
    eof

    File.open(filename, 'w') { |f| f.write(full_content) }
    FileUtils.touch(filename, mtime: mtime.to_time)
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

      body = post_file.data[:body]

      expect(body).to include('# A title')
      expect(body).to include('A paragraph')
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

  context '.import' do
    it 'touches the post_file model if the file is updated' do
      file = mock_post_file(mtime: 1.hour.ago)
      post_file = PostFile.import(file)
      old_timestamp = post_file.reload.updated_at

      file = mock_post_file
      new_post_file = PostFile.import(file)

      expect(new_post_file).to eq(post_file)
      expect(new_post_file.updated_at).to be > old_timestamp
    end

    it 'creates a post' do
      post_file = PostFile.import(mock_post_file)

      expect(post_file.post).to be_a(Post)
      expect(post_file.post).to be_valid
    end

    it 'updates the post when importing the same file' do
      old_post_file = PostFile.import(mock_post_file(mtime: 2.hours.ago))

      new_post_file = PostFile.import(mock_post_file(mtime: 1.hour.ago))

      expect(new_post_file.post).to eq(old_post_file.post)
    end

    it 'keeps track of when the file was last updated' do
      old_post_file = PostFile.import(mock_post_file(mtime: 2.hours.ago))
      old_timestamp = old_post_file.last_file_timestamp

      new_post_file = PostFile.import(mock_post_file(mtime: 1.hour.ago))

      expect(new_post_file.last_file_timestamp).to be > old_timestamp
    end
  end

  context 'Generated post' do
    it 'has the correct author' do
      post_file = PostFile.import(mock_post_file)

      author = post_file.data[:author]

      expect(post_file.post.author).to eq(author)
    end

    it 'has the correct title' do
      post_file = PostFile.import(mock_post_file)

      title = post_file.data[:title]

      expect(post_file.post.title).to eq(title)
    end

    it 'has the correct body' do
      post_file = PostFile.import(mock_post_file)

      body = post_file.data[:body]

      expect(post_file.post.body).to eq(body)
    end

    it 'has the correct tag list' do
      post_file = PostFile.import(mock_post_file)

      tag_list = post_file.data[:tag_list]

      expect(post_file.post.tag_list.join(', ')).to eq(tag_list)
    end
  end

  context '#valid?' do
    it 'prevents posts without title' do
      post_file = PostFile.import(mock_post_file(title: ''))

      expect(post_file).not_to be_valid
    end

    it 'prevents posts with non-existing author' do
      fake_author = build(:user, first_name: 'Barack', last_name: 'Obama')

      post_file = PostFile.import(mock_post_file(author: fake_author))

      expect(post_file).not_to be_valid
    end

    it 'prevents posts with blank body' do
      post_file = PostFile.import(mock_post_file(body: "   \n\n  "))

      expect(post_file).not_to be_valid
    end

    it 'prevents posts without tags' do
      post_file = PostFile.import(mock_post_file(tags: ' '))

      expect(post_file).not_to be_valid
    end

    it 'prevents posts without a primary tag' do
      post_file = PostFile.import(mock_post_file(tags: 'unimportant, stuff'))

      expect(post_file).not_to be_valid
    end

    it 'does not create a post when file is invalid' do
      expect {
        PostFile.import(mock_post_file(title: ''))
      }.not_to change { Post.count }
    end
  end
end
