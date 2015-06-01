%w(stylesheets javascripts images).each do |dir|
  Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'blue', dir)
end

