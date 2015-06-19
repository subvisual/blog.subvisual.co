if %w(development test).include? Rails.env
  require 'rubocop/rake_task'
  require 'scss_lint'
  require 'scss_lint/rake_task'

  RuboCop::RakeTask.new
  SCSSLint::RakeTask.new do |t|
    t.config = '.scss-lint.yml'
  end

  desc 'Lint code'
  task lint: [:rubocop, :scss_lint]
end
