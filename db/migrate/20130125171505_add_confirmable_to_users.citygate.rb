# This migration comes from citygate (originally 20120303195111)
class AddConfirmableToUsers < ActiveRecord::Migration
  def change
    add_column :citygate_users, :confirmation_token, :string

    add_column :citygate_users, :confirmed_at, :datetime

    add_column :citygate_users, :confirmation_sent_at, :datetime

    add_column :citygate_users, :unconfirmed_email, :string
  end
end
