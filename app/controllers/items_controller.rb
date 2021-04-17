class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

  def update
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :lead_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
