class AddFirstPharagraphToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :processed_intro, :text

    Post.find_each do |post|
      post.save
    end

    change_column_null :posts, :processed_intro, true
  end
end
