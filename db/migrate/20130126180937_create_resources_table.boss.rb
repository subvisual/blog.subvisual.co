# This migration comes from boss (originally 20120706130424)
class CreateResourcesTable < ActiveRecord::Migration
  def change
    create_table :boss_resources do |t|
      t.string   :resource_file_name
      t.string   :resource_content_type
      t.integer  :resource_file_size
      t.timestamps
    end
  end
end