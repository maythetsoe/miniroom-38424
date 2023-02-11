class DonationsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_donation, only: [:edit, :show, :update, :destroy]
    before_action :move_to_index, except: [:index, :show, :search]
  
    def index
      @donations = Donation.all.order("created_at DESC")
      @user = User.new
    end
  
    def new
      @donation = Donation.new
    end
  
    def create
      @donation = Donation.create(donation_params)
      if @donation.save
        redirect_to donations_path
      else
        render :new
      end
    end
  
    def edit
    if current_user.id != @donation.user.id || @donation.present?
    if current_user.id != @donation.user.id
        redirect_to donations_path
     end
    end
  end
  
    def update
    if @donation.update(donation_params)
      redirect_to donations_path
    else
      render :edit
    end
  end
  
  def destroy
    if @donation.destroy
      redirect_to donations_path
    else
      render :index
    end
  end
  
    def show
      @comment = Comment.new
      @comments = @donation.comments.includes(:user)
    end

    def search
      @donations = Donation.search(params[:keyword])
    end
  
    private
  
    def donation_params
      params.require(:donation).permit(:name, :description, :category_id, :condition_id, :delivery_id, :region_id, :ship_id, :image, :size_id).merge(user_id: current_user.id)
    end
  
    def set_donation 
      @donation = Donation.find(params[:id])
    end
  
    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
  end
