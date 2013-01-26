# This migration comes from citygate (originally 20121203192704)
class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :citygate_users, :username, :string
  end
end
