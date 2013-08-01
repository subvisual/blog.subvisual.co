class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :author
      t.string :title, null: false
      t.text   :body,  null: false

      t.datetime :published_at

      t.timestamps
    end
  end
end
