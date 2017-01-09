class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :tag_list, :processed_intro, :path
  belongs_to :author

  def path
    post_path(object)
  end
end
