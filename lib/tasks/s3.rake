namespace :s3 do
  task update_post_image_urls: :environment do
    Post.all.each do |post|
      post.body.gsub!(/uploads\/post_image\/image/, 'blog/post_image')
      post.save
    end
  end
end
