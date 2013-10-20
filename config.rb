Time.zone = "US/Eastern"

activate :blog do |blog|
  blog.calendar_template = "calendar.html"
  blog.layout = "blog_layout"
  blog.prefix = "blog"
  blog.tag_template = "tag.html"
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
