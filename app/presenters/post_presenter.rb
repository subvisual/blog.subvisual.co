class PostPresenter < RailsPresenter::Base

  present :category

  def publish_date
    h.l(published_at, format: h.t('post.publish_date')) if published?
  end

  def form_method
    if persisted?
      :patch
    else
      :put
    end
  end


end
