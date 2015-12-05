class CommentsController < ApplicationController
  def show
    @user_id = params[:user_id]
    @post_id = params[:post_id]
    @comment = Comment.find(params[:id])
    @user = User.find(@comment.user_id)
    @post = Post.find(@comment.post_id)

  end

  def new
    @comment = Comment.new
    @user_id = params[:user_id]
    @post_id = params[:post_id]
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @user_id = params[:user_id]
    @post_id = params[:post_id]
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post_id)
    else 
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_to post_path(comment.post_id)
    else
      render :show
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end