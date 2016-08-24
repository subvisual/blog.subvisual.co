class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :tag_list, :processed_intro
  belongs_to :author
end
