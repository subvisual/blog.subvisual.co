namespace :s3 do
  task update_post_image_urls: :environment do
    Post.all.each do |post|
      post.body.gsub!('https://subvisual.s3.amazonaws.com/blog/uploads/post_image/image', 'https://subvisual.s3.amazonaws.com/blog/post_image')
      post.save
    end
  end
end
