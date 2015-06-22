class AddPostIdToPostImages < ActiveRecord::Migration
  def change
    add_column :post_images, :post_id, :integer
  end
end
