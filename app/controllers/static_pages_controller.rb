class StaticPagesController < ApplicationController
  def home
    @posts = Post.paginate(page: params[:page], per_page: 10)
    @new_post = Post.new
  end

  def about
  end

  def help
  end
end
