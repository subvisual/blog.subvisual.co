module PostHelper
  def post_description(post)
    strip_tags(post.processed_body).
      gsub(/\n+/, ' ')[0...150].
      strip
  end

  def post_form_method(post)
    if post.persisted?
      :patch
    else
      :post
    end
  end
end
