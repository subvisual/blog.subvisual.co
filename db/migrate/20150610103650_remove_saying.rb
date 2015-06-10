class RemoveSaying < ActiveRecord::Migration
  def change
    drop_table :sayings
  end
end
