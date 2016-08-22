require "redcarpet"
require "rouge"
require "rouge/plugins/redcarpet"

module Services
  class PostProcessor
    def initialize(post)
      @post = post
    end

    def process
      extensions = { autolink: true, fenced_code_blocks: true, tables: true }
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
        full_doc.
          gsub(/<p><img/, '<p class="Post-imageWrapper"><img').
          gsub(/<a /, '<a target="_blank" ').
          gsub(%r{(<table>(.|\n)*?</table>)}) { wrap_table(Regexp.last_match[0]) }
      end

      private

      def wrap_table(table)
        <<-HTML
        <div class='PostTable'>
          <div class='highlight'>
            #{table}
          </div>
          <p class='PostTable-caption u-onlySmall'>You can scroll the table
          horizontally to see remaining values</p>
        </div>
        HTML
      end
    end
  end
end
