class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end

    change_table :posts do |t|
      t.references :category
    end
  end
end
