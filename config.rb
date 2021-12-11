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
end

activate :autoprefixer

activate :blog do |blog|
  blog.layout = "blog_layout"
  blog.prefix = "articles"
  blog.new_article_template = "templates/new_article_template.markdown.erb"
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.build_before = true
  deploy.branch = "gh-pages"
end

activate :syntax
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true

page "/feed.xml", layout: false
page "/sitemap.xml", layout: false

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

set :url_root, "http://bobnadler.com"
activate :search_engine_sitemap

configure :build do
  activate :asset_hash, ignore: "favicon.png"
  activate :minify_css
  activate :minify_javascript
end
