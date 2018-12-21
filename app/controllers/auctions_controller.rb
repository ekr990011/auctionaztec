class AuctionsController < ApplicationController
  
  def index
    @user = User.new
    @bids = Bid.all
    if Auction.count == 0
      @auction = Auction.new
      @update = false
    else
      @auction = Auction.last
      @update = true
      
      unless Bid.find_by(user_id: current_user.id)
        @bid = Bid.new
      else
        @bid = Bid.find_by(user_id: current_user.id)
      end
    end
    
  end
  
  def create
    if current_user.role == 'admin'
      @auction = Auction.new(auction_params)
      @auction.user_id = current_user.id
      @auction.time = Time.now.utc + @auction.days.to_i.days + 
        @auction.hours.to_i.hours + @auction.minutes.to_i.minutes
      
      if @auction.save
        flash[:success] = "Auction Created!"
        redirect_to '/'
      else
        flash[:alert] = "Please provide input!"
        redirect_to '/'
      end
    else
      flash[:alert] = "You are not Worthy!"
    end
  end
  
  def update
    if current_user.role == 'admin'
      @auction = Auction.last
      @auction.update(auction_params)
      @auction.user_id = current_user.id
      @auction.time = Time.now.utc + @auction.days.to_i.days + 
        @auction.hours.to_i.hours + @auction.minutes.to_i.minutes
      
      if @auction.save
        flash[:success] = "Auction Updated!"
        redirect_to '/'
      else
        flash[:alert] = "Please provide input!"
        redirect_to '/'
      end
    else
      flash[:alert] = "You are not Worthy!"
    end
  end
  
  def destroy
    puts 'got here!!!!!!!!!!!'
    if current_user.role == 'admin'
      Auction.last.destroy!
      flash[:success] = "Auction Deleted!"
      redirect_to '/'
    else
      flash[:alert] = "You are not worthy to sacrifice others!"
    end
  end
  
  
  private
  
  def auction_params
    params.require(:auction).permit(:name, :currency, :days, :hours, :minutes)
  end
  
end
