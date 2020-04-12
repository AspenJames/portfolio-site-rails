# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
Rails.application.config.assets.paths << Rails.root.join('lib', 'assets', 'revealjs', 'css')
Rails.application.config.assets.paths << Rails.root.join('lib', 'assets', 'revealjs', 'js')
Rails.application.config.assets.paths << Rails.root.join('lib', 'assets', 'revealjs', 'lib', 'css')
Rails.application.config.assets.paths << Rails.root.join('lib', 'assets', 'revealjs', 'lib', 'font')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

# CSS
Rails.application.config.assets.precompile += %w(static/about.css static/resume.css projects/detail.css projects/index.css presentations/coffee.css)
# JS
Rails.application.config.assets.precompile += %w(projects/detail.js codemirror/mode/javascript/javascript.js codemirror/mode/ruby/ruby.js projects/index.js static/about.js static/resume.js presentations/toggleBackground.js)
# MISC
Rails.application.config.assets.precompile += %w(favicon.ico)
# LIBS
Rails.application.config.assets.precompile += %w(css/reset.css css/reveal.css js/reveal.js css/theme/beige.css css/theme/black.css css/theme/blood.css css/theme/hull-blue.css css/theme/league.css css/theme/moon.css css/theme/serif.css css/theme/simple.css css/theme/sky.css css/theme/solarized.css css/theme/white.css)
