class BidsController < ApplicationController
  def create
    if (current_user && Time.now.utc < Auction.last.time)
      unless Bid.find_by(user_id: current_user.id)
        @bid = Bid.new(bid_params)
        @bid.user_id = current_user.id
        @bid.auction_id = Auction.last.id
        if @bid.save
          flash[:success] = "Bid Created!"
          redirect_to '/'
        else
          flash[:alert] = "Please provide input!"
          redirect_to '/'
        end
      else
        @bid = Bid.find_by(user_id: current_user.id)
        @bid.update(bid_params)
        @bid.auction_id = Auction.last.id
        if @bid.save
          flash[:success] = "Bid Updated!"
          redirect_to '/'
        else
          flash[:alert] = "Please provide input!"
          redirect_to '/'
        end
      end
    end
  end
  
  private
  
  def bid_params
    params.require(:bid).permit(:bid)
  end
  
end
