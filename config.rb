###
# Compass
###

compass_config do |config|
    # Require any additional compass plugins here.
    config.add_import_path "bower_components/foundation/scss"
    
    # Set this to the root of your project when deployed:
    config.http_path = "/"
    config.css_dir = "stylesheets"
    config.sass_dir = "stylesheets"
    config.images_dir = "images"
    config.javascripts_dir = "javascripts"
    
    # You can select your preferred output style here (can be overridden via the command line):
    # output_style = :expanded or :nested or :compact or :compressed
    
    # To enable relative paths to assets via compass helper functions. Uncomment:
    # relative_assets = true
    
    # To disable debugging comments that display the original location of your selectors. Uncomment:
    # line_comments = false
    
    
    # If you prefer the indented syntax, you might want to regenerate this
    # project again passing --syntax sass, or you can uncomment this:
    # preferred_syntax = :sass
    # and then run:
    # sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass
    
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
    activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Add bower's directory to sprockets asset path
after_configuration do
    @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
    sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Middleman-deploy Gem settings (https://github.com/tvaughan/middleman-deploy):
  # activate :deploy do |deploy|
  # deploy.method   = :rsync
  # deploy.host     = "mistermachineshop.com"
  # deploy.path     = "/var/www/elp-patterns"
  # deploy.user     = "root"
  # Optional Settings
  # deploy.port  = 5309 # ssh port, default: 22
  # deploy.clean = true # remove orphaned files on remote host, default: false
  # deploy.flags = "-rltgoDvzO --no-p --del -e" # add custom flags, default: -avze
# end

# activate :deploy do |deploy|
#   deploy.method = :git
#   # Optional Settings
#   # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
#   # deploy.branch   = 'custom-branch' # default: gh-pages
#   # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
#   # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
# end

