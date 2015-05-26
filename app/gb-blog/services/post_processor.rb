require 'pygmentize'
require 'redcarpet'

module Services
  class PostProcessor
    def initialize(post)
      @post = post
    end

    def process
      extensions = { autolink: true, fenced_code_blocks: true }
      redcarpet = Redcarpet::Markdown.new(HTMLPygmentizedRenderer, extensions)
      post.processed_body = redcarpet.render(post.body)
      post.processed_intro = redcarpet.render(markdown_intro)
    end

    private

    attr_reader :post

    def markdown_intro
      accumulated_size = 0
      post.body.split(%r(((\r)?\n){2}))[0]
    end

    class HTMLPygmentizedRenderer < Redcarpet::Render::HTML
      def block_code(code, language)
        Pygmentize.process(code, language)
      end
    end
  end
end
