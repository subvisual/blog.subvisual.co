class PostFile < ActiveRecord::Base
  belongs_to :post

  validates :filename, presence: true

  def metadata
    @metadata ||= YAML.load_file(filename)
  end

  def data
    {
      title: metadata['title'],
      tag_list: metadata['tags'],
      author: author,
      body: body
    }
  end

  def author
    User.from_full_name(metadata['author'])
  end

  def body
    @body ||= File.read(Rails.root.join(filename)).gsub(/^\s*---(.*?)---\s/m, "")
  end

  def self.import(file)
    post_file = where(filename: file).first_or_create

    if File.mtime(post_file.filename) > post_file.updated_at
      post_file.touch
    end

    post_file
  end
end
