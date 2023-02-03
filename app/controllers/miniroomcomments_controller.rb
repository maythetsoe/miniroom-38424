class MiniroomcommentsController < ApplicationController
  def create
    @miniroomcomment = Miniroomcomment.create(miniroomcomment_params)
    if @miniroomcomment.save
    redirect_to miniroom_path(@miniroomcomment.miniroom)
    else
      @miniroom = @comment.miniroom
      @comments = @miniroom.comments.includes(:user)
      render "minirooms/show"
    end
 end

private
def miniroomcomment_params
  params.require(:miniroomcomment).permit(:content).merge(user_id: current_user.id, miniroom_id: params[:miniroom_id])
end
end
