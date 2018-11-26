class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id)
  end

  def new
  end

  def create
    @post = Post.new(
        post_title: params[:post_title],
        post_content: params[:post_content]
    )
    if @post.save
      redirect_to posts_path
    end


  end



end
