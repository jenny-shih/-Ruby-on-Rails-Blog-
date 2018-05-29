class CommentsController < ApplicationController
  http_basic_authenticate_with :name => "shih", :password => "secret", :only => :destroy

  def create
    @post = Post.find(params[:post_id])
    params.permit!
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    params.permit!
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
