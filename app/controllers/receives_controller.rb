class ReceivesController < ApplicationController
    before_action :authenticate_user!, only: :index
    before_action :set_donation, only: [:index, :create]
  
    def index
     @receive = Receive.new
    if current_user.id == @donation.user.id || @donation.receive.present?
      redirect_to root_path
    end
  end
  
    def create
      @receive = Receive.new(receive_params)
      if @receive.valid?
        @receive.save
      return redirect_to donations_path
    else
     render :index
     end
  end
  
    private

    def receive_params
      params.require(:receive).permit(:donation_id, :image, :post_code, :region_id, :city, :address, :phone_num).merge(user_id: current_user.id, donation_id: @donation.id)
    end
  
    def set_donation
      @donation = Donation.find(params[:donation_id])
    end
  end
