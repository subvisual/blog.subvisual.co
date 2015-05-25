class AddTagsToPosts < ActiveRecord::Migration
  def up
    Post.find_each do |post|
      post.tag_list = post.category.name.downcase
    end

    remove_column :posts, :category_id
    drop_table :categories
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't recover the deleted categories"
  end
end
