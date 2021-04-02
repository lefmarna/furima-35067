class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :check_user

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_user
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_address).permit(:zip, :prefecture, :city, :address_line1, :address_line2, :phone_number).merge(user_id: current_user.id).merge(item_id: @item.id)
  end
end
