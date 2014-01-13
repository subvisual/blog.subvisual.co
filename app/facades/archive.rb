module Facades
  class Archive

    def initialize(posts = [])
      @posts = posts
    end

    def years
      @posts.map { |post| publication_year(post) }.uniq
    end

    def posts_from_year(year)
      @posts.select { |post| publication_year(post) == year }
    end

    private
    attr_reader :posts

    def publication_year(post)
      post.published_at.year
    end

  end
end
