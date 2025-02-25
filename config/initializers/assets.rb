# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Rails.root.join("node_modules")

# Precompile additional assets.
Rails.application.config.assets.precompile += %w( application.css )

# For GitHub Pages deployment, make sure assets have correct relative paths
if Rails.env.production?
  # Don't use a leading slash for assets in production
  Rails.application.config.assets.prefix = 'assets'
  
  # Enable public file server for static files
  Rails.application.config.public_file_server.enabled = true
end
