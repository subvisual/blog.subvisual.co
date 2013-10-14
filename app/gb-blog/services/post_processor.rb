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
    end

    private

    attr_reader :post

    class HTMLPygmentizedRenderer < Redcarpet::Render::HTML
      def block_code(code, language)
        Pygmentize.process(code, language)
      end
    end

  end
end
