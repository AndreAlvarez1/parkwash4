# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths << Rails.root.join('vendor')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'style')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'script')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'script', 'backstretch')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'script', 'revolution')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'script', 'revolution', 'extensions')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'script', 'template')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'media')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'media', 'image')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'font')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'plugin', 'booking')
Rails.application.config.assets.precompile += %w[*.jpg *.png *.svg *.gif *.bmp]
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

#CHARTKICK ASSETS PRECOMPILE
Rails.application.config.assets.precompile += %w( chartkick.js )
