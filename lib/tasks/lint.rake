if %w(development test).include? Rails.env
  require 'rubocop/rake_task'
  require 'scss_lint'
  require 'scss_lint/rake_task'

  desc 'Run JSCS code style linter'
  task :jscs => :environment do
    puts 'Running JSCS...'
    return_status = system './node_modules/.bin/jscs app/assets/javascripts --verbose --reporter=inline'
    exit 1 if !return_status
  end

  RuboCop::RakeTask.new
  SCSSLint::RakeTask.new do |t|
    t.config = '.scss-lint.yml'
  end

  desc 'Lint code'
  task lint: [:rubocop, :scss_lint, :jscs]
end
