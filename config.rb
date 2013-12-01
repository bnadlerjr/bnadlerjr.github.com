Time.zone = "US/Eastern"

helpers do
  def gist(id)
    "<script src='https://gist.github.com/bnadlerjr/#{id}.js'></script>"
  end

  def icon(name, url)
    link_to(url, class: "icon-#{name}") do
      tag :img, src: ""
    end
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

page "/feed.xml", :layout => false

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript
end
