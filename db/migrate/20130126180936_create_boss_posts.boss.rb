# This migration comes from boss (originally 20120624233540)
class CreateBossPosts < ActiveRecord::Migration
  def change
    create_table :boss_posts do |t|
      t.string :title,          :null => false
      t.text :body,             :null => false
      t.datetime :start_date
      t.boolean :draft,         :default => true

      t.timestamps
    end
  end
end
