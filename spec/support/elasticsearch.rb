require 'rake'
require 'elasticsearch/extensions/test/cluster/tasks'

RSpec.configure do |config|
  config.before :each do
    Elasticsearch::Extensions::Test::Cluster.start(port: 9200) unless Elasticsearch::Extensions::Test::Cluster.running?
  end

  config.after :suite do
    Elasticsearch::Extensions::Test::Cluster.stop(port: 9200) if Elasticsearch::Extensions::Test::Cluster.running?
  end
end
