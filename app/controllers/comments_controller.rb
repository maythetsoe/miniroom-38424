class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
    redirect_to donation_path(@comment.donation)
    else
      @donation = @comment.donation
      @comments = @donation.comments.includes(:user)
      render "donations/show"
    end
 end

private
def comment_params
  params.require(:comment).permit(:content).merge(user_id: current_user.id, donation_id: params[:donation_id])
end
end
