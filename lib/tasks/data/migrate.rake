def ensure_date(date)
  return if Date.today == date

  puts "This task was intended to migrate data on #{date}. It's not wise to run it today"
  exit
end

namespace :data do
  namespace :migrate do
    task post_image_to_hero: :environment do
      ensure_date(Date.new(2016, 8, 30))

      puts "Migrating hero images from PostImage to Hero"

      ActiveRecord::Base.transaction do
        PostImage.where("post_id IS NOT NULL").find_each do |post_image|
          hero = Hero.create(post_image.attributes.slice("post_id", "width", "height"))
          hero.image = post_image.image
          hero.save
        end
      end

      puts "### DONE ###"
    end
  end
end
