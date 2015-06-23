class CreateSaying < ActiveRecord::Migration
  def change
    create_table :sayings do |t|
      t.string :saying

      t.timestamps
    end

    if defined?(Saying)
      Saying.create!(saying: 'Sharing ideas can change the world. It definitely changes us')
    end
  end
end
