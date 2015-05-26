class AddTagsToPosts < ActiveRecord::Migration
  class Category < ActiveRecord::Base
  end

  def up
    Post.find_each do |post|
      post.tag_list = Category.find(post.category_id).name.downcase
      post.save
    end

    remove_column :posts, :category_id
    drop_table :categories
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted categories"
  end
end
