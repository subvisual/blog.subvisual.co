namespace :s3 do
  task update_post_image_urls: :environment do
    Post.all.each do |post|
      post.body.gsub!(/\(\/blog\/uploads\/post_image/, '(https://subvisual.s3.amazonaws.com/blog/uploads/post_image')
      post.save
    end
  end
end
