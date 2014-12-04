require Rails.root.join 'app/facades/archive'

class ArchivesController < ApplicationController
  decorates_assigned :posts

  def show
    @posts = Post.all_published
    filter_by_category
    filter_by_author
    @archive = Facades::Archive.new(@posts.decorate)
  end

  private

  def filter_by_category
    return unless archive_params[:category]

    category = Category.from_param(params[:category])
    @posts = @posts.by_category(category)
  end

  def filter_by_author
    return unless archive_params[:author]

    first_name, last_name = params[:author].split('-')
    author = User.where(first_name: first_name, last_name: last_name).first
    @posts = @posts.by_author(author)
  end

  def archive_params
    params.permit(:category, :author)
  end
end
