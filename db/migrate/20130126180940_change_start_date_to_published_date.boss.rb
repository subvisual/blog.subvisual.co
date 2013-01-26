# This migration comes from boss (originally 20120810170007)
class ChangeStartDateToPublishedDate < ActiveRecord::Migration
  def change
    rename_column :boss_posts, :start_date, :published_date
  end
end
