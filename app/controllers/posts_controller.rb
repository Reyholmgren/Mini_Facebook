class PostsController < ApplicationController
  
  def show
    # @comments = Comment.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    @user = User.find(@post.user_id)

  end

  def new
    @user_id = params[:user_id]
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @user_id = params[:user_id]
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(@post.user_id)
    else 
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to user_path(@post.user_id)
    else
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end



