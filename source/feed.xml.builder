xml.rss :version => "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom", "xmlns:media" => "http://search.yahoo.com/mrss/" do
  xml.channel do
    site_url = "http://bobnadler.com/"
    xml.title "Bob Nadler, Jr."
    xml.link site_url
    xml.description "Articles from Bob Nadler, Jr."
    xml.lastBuildDate blog.articles.first.date.to_time.rfc822
    xml.atom :link, "href" => URI.join(site_url, current_page.path), "rel" => "self", "type" => "application/rss+xml"

    blog.articles[0..5].each do |article|
      xml.item do
        xml.title article.title
        xml.link URI.join(site_url, article.url)
        xml.guid URI.join(site_url, article.url)
        xml.pubDate article.date.to_time.rfc822
        xml.author "bnadlerjr@gmail.com (Bob Nadler, Jr.)"
        xml.description article.summary
        xml.media :content, :url => full_url("images/articles/#{article.data.image}"), "medium" => "image"
      end
    end
  end
end
