if Rails.env.production?
  # :nocov:
  Post.import
  # :nocov:
end
