# This migration comes from citygate (originally 20120507112430)
class AddOmniauthToDevise < ActiveRecord::Migration
  def change
    add_index :citygate_users, :confirmation_token,   :unique => true
    add_column :citygate_users , :password_salt, :string
    
    create_table :citygate_authorizations do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id
      t.string :token
      t.string :secret
      t.string :name
      t.string :link
      t.string :image_url

      t.timestamps
    end
  end
end
