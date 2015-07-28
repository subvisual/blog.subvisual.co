module Services
  class PostFileImporter
    POSTS_DIR = Rails.root.join('posts')

    def process
      all_files.each do |file|
        PostFile.import(file)
        import_file(file)
      end
    end


    private

    def all_files
      @all_files ||= Dir.glob(POSTS_DIR.join('*.md'))
    end

    attr_reader :all_files
  end
end
