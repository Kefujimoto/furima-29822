class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_id, only: [:new, :create]

  def index

  end

  def new
    @order_address = OrderAddress.new
    redirect_to root_path if current_user.id == @item.user_id
    redirect_to root_path if @item.order.present?
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def order_params
    params.permit(:area_id, :post_number, :city_number, :house_number, :building_name, :phone_number, :item_id, :token).merge(user_id:current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

end
