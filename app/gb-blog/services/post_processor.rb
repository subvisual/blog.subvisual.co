require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

module Services
  class PostProcessor
    def initialize(post)
      @post = post
    end

    def process
      extensions = { autolink: true, fenced_code_blocks: true }
      redcarpet = Redcarpet::Markdown.new(SyntaxHighlightedRenderer, extensions)
      post.processed_body = redcarpet.render(post.body)

      return unless post.respond_to?(:processed_intro=)

      post.processed_intro = redcarpet.render(markdown_intro)
    end

    private

    attr_reader :post

    def markdown_intro
      post.body.split(/((\r)?\n){2}/)[0]
    end

    class SyntaxHighlightedRenderer < Redcarpet::Render::HTML
      include Rouge::Plugins::Redcarpet

      def postprocess(full_doc)
        full_doc.gsub(%r{<p><img}, '<p class="Post-imageWrapper"><img')
      end
    end
  end
end
