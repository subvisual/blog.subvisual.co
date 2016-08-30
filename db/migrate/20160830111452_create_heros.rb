class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :image
      t.references :post
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
