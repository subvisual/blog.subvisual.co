# This migration comes from boss (originally 20120706155028)
class AddContentTypeIndexToResources < ActiveRecord::Migration
  def change
    add_index :boss_resources, :resource_content_type
  end
end
