class AddTwiterAndBioToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :twitter_handle
      t.text :bio
    end
  end
end
