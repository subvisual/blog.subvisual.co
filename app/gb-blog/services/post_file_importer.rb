module Services
  class PostFileImporter
    POSTS_DIR = Rails.root.join('posts')

    def import
      binding.pry
      all_files.each do |file|
        PostFile.import(file)
      end
    end

    private

    def all_files
      @all_files ||= Dir.glob(POSTS_DIR.join('*.md'))
    end
  end
end
