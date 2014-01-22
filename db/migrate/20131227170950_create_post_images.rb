class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.string :image
    end
  end
end
