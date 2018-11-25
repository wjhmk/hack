class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to("/posts/#{@comment.post_id}")
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content,:post_id)
  end
end
