xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = "http://bobnadler.com/"
  xml.title "Bob Nadler, Jr."
  #xml.subtitle ""
  xml.id site_url
  xml.link "href" => site_url
  xml.link "href" => URI.join(site_url, current_page.path), "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "Bob Nadler, Jr." }

  blog.articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
      xml.id URI.join(site_url, article.url)
      xml.published article.date.to_time.iso8601
      xml.updated File.mtime(article.source_file).iso8601
      xml.author { xml.name "Bob Nadler, Jr." }
      xml.description article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
      xml.media url: full_url("images/articles/#{article.data.image}"), "medium" => "image"
    end
  end
end
