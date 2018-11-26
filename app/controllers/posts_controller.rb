class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id)
  end

  def new
      @question = current_user.questions.new
  end

  def create
    @post = current_user.posts.new(
        post_title: params[:post_title],
        post_content: params[:post_content]
    )
    if @post.save
      redirect_to posts_path
    end


  end


end
