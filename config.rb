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

  def social_buttons
<<-SNIPPET
<a href="https://twitter.com/share" class="twitter-share-button" data-via="bnadlerjr" data-dnt="true">Tweet</a>
<div style="width: 117px; display: inline-block">
<div class="g-plus" data-action="share" data-annotation="bubble"></div>
</div>
<script type="IN/Share" data-counter="right"></script>
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

page "/feed.xml", layout: false
page "/sitemap.xml", layout: false

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript
end
