namespace :data do
  namespace :search do
    task rebuild: :environment do
      puts "Rebuilding search index for posts"
      PgSearch::Document.delete_all(searchable_type: "Post")
      PgSearch::Multisearch.rebuild(Post)
      puts "### DONE ###"
    end
  end
end
