class AddHqIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hq_id, :integer
  end
end
