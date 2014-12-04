desc 'run rubocop checker if in the correct environment'
task :rubocop do
  return unless %w(development test).include? Rails.env
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
  Rake::Task['rubocop'].invoke
end
