# This migration comes from boss (originally 20120903112923)
class CreateCategories < ActiveRecord::Migration
  def up
    create_table :boss_categories do |t|
      t.string :name

      t.timestamps
    end

    add_column :boss_posts, :category_id, :integer, :default => 1
    add_index  :boss_posts, :category_id
  end

  def down
    drop_table :boss_categories
    remove_column :boss_posts, :category_id
    remove_index :boss_posts, :category_id
  end
end
