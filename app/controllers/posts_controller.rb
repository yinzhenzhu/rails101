class PostsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
end

 def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.user = current_user
    @post.group = @group
    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end
  def destroy

    @post = Post.find(params[:id])
    @post.destroy
    redirect_to group_path(@group)
    flash[:alert] = "post deleted"
  end

private
  def post_params
    params.require(:post).permit(:content)
  end


end
