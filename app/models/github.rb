module Github
  def self.adapter
    if Rails.env.production?
      Adapter
    else
      FakeAdapter
    end
  end
end
