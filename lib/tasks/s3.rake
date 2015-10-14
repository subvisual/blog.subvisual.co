namespace :s3 do
  desc 'Used when we migrated from local server storage to Amazon S3'
  task update_post_image_urls: :environment do
    Post.all.each do |post|
      post.body.gsub!('https://subvisual.s3.amazonaws.com/blog/uploads/post_image/image', 'https://subvisual.s3.amazonaws.com/blog/post_image')
      post.save
    end
  end
end
