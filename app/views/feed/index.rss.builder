xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do

  xml.channel do
    xml.title 'Subvisual blog'
    xml.description t('meta.description')
    xml.link root_url
    xml.tag! 'atom:link', rel: 'self', type: 'application/rss+xml', href: feed_url

    posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.processed_body
        xml.author post.author.email
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end

end
