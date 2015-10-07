class CreatePostFilesTable < ActiveRecord::Migration
  def change
    create_table :post_files do |t|
      t.string :filename, null: false
      t.references :post
      t.timestamps
    end
  end
end
