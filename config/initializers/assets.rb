# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w(static/about.css static/resume.css projects/detail.css projects/index.css)
Rails.application.config.assets.precompile += %w(projects/detail.js codemirror/mode/javascript/javascript.js codemirror/mode/ruby/ruby.js)
Rails.application.config.assets.precompile += %w(favicon.ico)
