Time.zone = "US/Eastern"

helpers do
  def full_url(url)
    "http://bobnadler.com/#{url}"
  end

  def title
    name = "Bob Nadler, Jr"
    current_article ? "#{name} | #{current_article.title}" : name
  end

  def gist(id)
    "<script src='https://gist.github.com/bnadlerjr/#{id}.js'></script>"
  end

  def icon(name, url)
    link_to("", url, class: "icon-#{name}")
  end

  def twitter_share_button
<<-SNIPPET
<a href="https://twitter.com/share" class="twitter-share-button" data-via="bnadlerjr" data-dnt="true">Tweet</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
SNIPPET
  end

  def article_image(options)
    image = image_tag("articles/#{options[:filename]}", alt: options[:alt], width: "256")

<<SNIPPET
<figure class="article-image">
    <a href="#{options[:url]}">
        #{image}
    </a>
    <figcaption>Image by <span>#{options[:source]}</span></figcaption>
</figure>
SNIPPET
  end
end

activate :blog do |blog|
  blog.layout = "blog_layout"
  blog.prefix = "blog"
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
  deploy.branch = "master"
end

activate :syntax
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true

page "/feed.xml", :layout => false

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript
end
