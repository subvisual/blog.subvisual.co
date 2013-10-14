xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0' do
  xml.channel do
    xml.title 'Group Buddies Blog'
    xml.description 'PLACEHOLDER'
    xml.link root_url

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.body
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
