class AddProcessedBodyToPost < ActiveRecord::Migration
  def change
    add_column :posts, :processed_body, :text

    Post.update_all(processed_body: "")

    change_column :posts, :processed_body, :text, null: false
  end
end
