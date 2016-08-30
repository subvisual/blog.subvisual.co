class RemovePostIdFromPostImages < ActiveRecord::Migration
  def change
    remove_column :post_images, :post_id, :integer
  end
end
