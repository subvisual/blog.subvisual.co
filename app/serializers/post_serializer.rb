class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :tag_list
  attribute :processed_intro, key: :body
  belongs_to :author
end
