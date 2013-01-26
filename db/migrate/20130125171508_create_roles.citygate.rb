# This migration comes from citygate (originally 20120523163700)
class CreateRoles < ActiveRecord::Migration
  def change
    create_table :citygate_roles do |t|
      t.string :name
      t.timestamps
    end
    
    add_column :citygate_users, :role_id, :integer
  end
end
