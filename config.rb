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

  def reading_time(article)
    minutes = (article.body.split.size / 180).floor
    minutes.positive? ? "#{minutes} min read" : 'less than 1 min read'
  end

  def menu_link(text, url, icon)
    active = url == "/#{current_page.path}"
    icon_tag = content_tag(:i, '', class: "fas fa-fw me-2 #{icon}")
    link_text = active ? "#{text} #{content_tag(:span, class: 'sr-only') { '(current)' }}" : text

    content_tag(:li, class: 'nav-item') do
      link_to("#{icon_tag} #{link_text}", url, class: active ? 'nav-link active' : 'nav-link')
    end
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
