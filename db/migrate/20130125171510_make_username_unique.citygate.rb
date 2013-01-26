# This migration comes from citygate (originally 20130110113922)
class MakeUsernameUnique < ActiveRecord::Migration
  def change
    add_index :citygate_users, :username, unique: true
  end
end
