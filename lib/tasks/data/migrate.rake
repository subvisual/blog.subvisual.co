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

    task destroy_old_post_images: :environment do
      ensure_date(Date.new(2016, 8, 30))

      puts "Deleting old PostImage records migrated into Hero"

      ActiveRecord::Base.transaction do
        PostImage.where("post_id IS NOT NULL").destroy_all
      end

      puts "### DONE ###"
    end

    task recreate_images: :environment do
      Hero.find_each do |h|
        begin
          h.image.recreate_versions!
          h.save
        rescue StandardError
          puts "Warning. failed for Hero with id=#{i.id}"
        end
      end

      PostImage.find_each do |i|
        begin
          i.image.recreate_versions!
          i.save
        rescue StandardError
          puts "Warning. failed for PostImage with id=#{i.id}"
        end
      end
    end
  end
end
