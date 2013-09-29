class PostPresenter < RailsPresenter::Base

  present :category, :author

  def self.model_name
    Post.model_name
  end

  def publish_date
    h.l(published_at, format: h.t('post.publish_date')) if published?
  end

  def body
    h.raw(super)
  end

  def form_method
    if persisted?
      :patch
    else
      :post
    end
  end


end
