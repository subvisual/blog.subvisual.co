namespace :posts do
  task import: :environment do
    Services::PostFileImporter.new.import
  end
end
