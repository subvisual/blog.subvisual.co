class AddLastFileTimestampToPostFiles < ActiveRecord::Migration
  def change
    add_column :post_files, :last_file_timestamp, :datetime
  end
end
