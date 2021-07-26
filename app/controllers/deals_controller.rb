class DealsController < ApplicationController

  before_action :authenticate_user
  skip_before_action :verify_authenticity_token, only: [:create_user_deal]

  def add_deal
    unless current_user.is_admin == true
      redirect_to root_url
    end
    @post_submit_url = deal_post_add_path
  end

  def create
    deal = Deal.new(deal_create_params)
    if deal.save
      deal.update_columns(is_active:true) if deal.publish_date == DateTime.now.in_time_zone("New Delhi").beginning_of_day + 10.hour
      flash[:success] = "Deal successfully created"
      redirect_to all_deals_path
    else
      flash[:danger] = "Deal couldn't be created."
      redirect_to :back 
    end
  end

  def index
    @deals = Deal.all
  end

  def occupied_dates
    occupied_dates = Array.new
    dates = Deal.pluck(:publish_date)
    dates.each do |date|
      occupied_dates << date.strftime('%d-%m-%Y')
    end
    render json: occupied_dates,status: :ok
  end

  def todays_deal
    unless logged_in?
      redirect_to root_url
    end
    # @deal = Deal.where(is_active:true).first
    # if @deal.present?
    #   user = @current_user
    #   @already_bought = false
    #   if user.user_deals.where(user_id:user.id,deal_id:@deal.id).present?
    #     @already_bought = true
    #   end
    #   @additional_discount = user.user_deals.last.additional_discount if user.user_deals.present?
    #   if @additional_discount.present? && @additional_discount > 0
    #     @latest_discounted_price = @deal.discounted_price - ( (@additional_discount/100.to_f) * @deal.discounted_price )
    #   else
    #     @latest_discounted_price = @deal.discounted_price
    #   end
    # end
  end

  def create_user_deal
    deal = Deal.where(is_active:true).first
    user = @current_user
    if user.user_deals.where(user_id:user.id,deal_id:deal.id).present? 
      flash[:danger] = "Quantity limited to one per customer."
      redirect_to :back and return
    end
    if deal.quantity < 1 
      flash[:danger] = "Sorry, Deal out of stock"
      redirect_to :back and return
    end

    additional_discount = user.user_deals.count
    additional_discount =  5 if additional_discount > 5

    user_deal = UserDeal.new(user_id:user.id,deal_id:deal.id,additional_discount:additional_discount)
    if user_deal.save
      latest_quantity = deal.quantity - 1
      deal.update_columns(quantity: latest_quantity)
      flash[:success] = "Order Created successfully."
      redirect_to :back 
    else
      flash[:danger] = user_deal.first.error
      redirect_to :back
    end
    # end

  end

  private 

  def deal_create_params
    params[:publish_date]  = Time.at(params[:publish_date].to_datetime.to_i).beginning_of_day+10.hour
    params.permit(:title,:description,:price,:discounted_price,:quantity,:publish_date,:image)
  end

end
