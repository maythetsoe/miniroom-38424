class MiniroomsController < ApplicationController
  before_action :set_miniroom, only: [:edit, :show, :update, :destroy]

  def index
    @minirooms = Miniroom.all.order("created_at DESC")
    @user = User.new
  end

  def new
    @miniroom = Miniroom.new
  end
  
  def create
    @miniroom = Miniroom.new(miniroom_params)
    if @miniroom.save  
    redirect_to root_path
    else
      render :new
    end
  end

  def show
    @miniroomcomment = Miniroomcomment.new
    @miniroomcomments = @miniroom.miniroomcomments.includes(:user)
  end

  def edit
    if user_signed_in? && current_user.id == @miniroom.user_id 
     redirect_to miniroom_path  unless current_user.id == @miniroom.user_id
    else
       redirect_to root_path
    end
  end

  def update
   if @miniroom.update(miniroom_params)
    redirect_to miniroom_path
   else
    render :edit
   end
  end

  def destroy
    if @miniroom.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def miniroom_params
    params.require(:miniroom).permit(:title, :concept, :image).merge(user_id: current_user.id)
  end

  def set_miniroom 
    @miniroom = Miniroom.find(params[:id])
  end

end
