if Rails.env.production?
  Post.import
end
