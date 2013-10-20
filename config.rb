Time.zone = "US/Eastern"

helpers do
  def gist(id)
    tag(:script, src: "https://gist.github.com/bnadlerjr/#{id}.js")
  end
end

activate :blog do |blog|
  blog.layout = "blog_layout"
  blog.prefix = "blog"
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
