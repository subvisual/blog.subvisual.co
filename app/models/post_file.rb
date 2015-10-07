class PostFile < ActiveRecord::Base
  belongs_to :post

  validates :filename, presence: true
  validates_associated :post

  before_save :update_post

  def metadata
    @metadata ||= YAML.load_file(filename) || {}
  end

  def data
    {
      title: metadata['title'],
      tag_list: (metadata['tags'] || '').downcase,
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
    where(filename: file).first_or_initialize.tap(&:save)
  end

  def update_post
    file_timestamp = File.mtime(filename)
    return if last_file_timestamp && last_file_timestamp >= file_timestamp

    build_post unless post
    post.tag_list = data[:tags]
    post.update(data)

    assign_attributes post: post, last_file_timestamp: file_timestamp
  end
end
