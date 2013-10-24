require 'capistrano'

namespace :puma do
  desc "Start puma"
  task :start => 'rvm:hook' do
    on roles :app do
      within current_path do
        puma_exec :start, start_options
      end
    end
  end

  desc "Stop puma"
  task :stop => 'rvm:hook' do
    on roles :app do
      within current_path do
        pumactl_exec "-S #{state_path} stop"
      end
    end
  end

  desc "Puma status"
  task :status => 'rvm:hook' do
    on roles :app do
      within current_path do
        puts capture :bundle, :exec, :pumactl, "-S #{state_path} status"
      end
    end
  end

  desc "Restart puma"
  task :restart => 'rvm:hook' do
    on roles :app do
      within current_path do
        begin
          pumactl_exec "-S #{state_path} restart"
        #rescue Capistrano::CommandError => ex
          #puts "Failed to restart puma: #{ex}\nAssuming not started"
          #start
        end
      end
    end
  end

  desc "Restart puma (phased restart)"
  task :phased_restart => 'rvm:hook' do
    on roles :app do
      within current_path do
        pumactl_exec "-S #{state_path} phased-restart"
      end
    end
  end

  def puma_exec(*args)
    execute :bundle, :exec, :puma, *args
  end

  def pumactl_exec(*args)
    execute :bundle, :exec, :pumactl, *args
  end


  def puma_state
    "#{shared_path}/sockets/puma.state"
  end

  def puma_socket
    "#{shared_path}/sockets/puma.sock"
  end

  def start_options
    if config_file
      "-q -d -e #{puma_env} -C #{config_file}"
    else
      "-q -d -e #{puma_env} -b '#{puma_socket}' -S #{state_path} --control 'unix://#{shared_path}/sockets/pumactl.sock'"
    end
  end

  def config_file
    @_config_file ||= begin
      file = fetch(:puma_config_file, nil)
      file = "./config/puma/#{puma_env}.rb" if !file && File.exists?("./config/puma/#{puma_env}.rb")
      file
    end
  end

  def puma_env
    fetch(:rack_env, fetch(:rails_env, 'production'))
  end

  def state_path
    (config_file ? configuration.options[:state] : nil) || puma_state
  end

  def configuration
    require 'puma/configuration'
    config= Puma::Configuration.new config_file: config_file
    config.load
    config
  end

end

task :uptime do
  info "Host"
end
