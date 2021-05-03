class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  
  def index
    if current_user.id == @item.user.id || @item.order.present?
      redirect_to root_path
    end
    @user = @item.user
    @order_form = OrderForm.new
  end

  def create
    if current_user.id == @item.user.id
      redirect_to root_path
    end
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :number, :exp_month, :exp_year, :cvc).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
