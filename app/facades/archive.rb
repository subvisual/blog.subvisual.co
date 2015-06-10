module Facades
  class Archive
    def initialize(posts = [])
      @posts = posts
    end

    def years
      @posts.map(&:publication_year).uniq
    end

    def posts_from_year(year)
      @posts.select { |post| post == year }
    end

    private

    attr_reader :posts
  end
end
