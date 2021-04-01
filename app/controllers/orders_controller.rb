class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id
  end
end
