class AddImageTmpToPostImages < ActiveRecord::Migration
  def change
    add_column :post_images, :image_tmp, :string
  end
end
