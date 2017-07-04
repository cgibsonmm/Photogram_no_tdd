class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post successfully created!'
      redirect_to posts_path
    else
      flash[:danger] = 'Post unsuccessfully created!'
      render 'new'
    end
  end

private

  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
