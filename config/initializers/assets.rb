%w(stylesheets javascripts images).each do |dir|
  Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'blue', dir)
end
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components', 'font-awesome', 'scss')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components', 'font-awesome', 'fonts')

Rails.application.config.assets.precompile += %w(admin.css admin.js)
