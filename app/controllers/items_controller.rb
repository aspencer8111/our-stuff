class ItemsController < ApplicationController
  before_filter :check_admin, only: [:new]

  def index
    @items = Item.unclaimed
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "Item has been added."
    else
      render :new, alert: "Something wen't wrong"
    end
  end

  def update
    @item = Item.find(params[:id])

    if params[:item][:user_id]
      params[:item][:user_id] = current_user.id
    end

    @item.update_attributes(item_params)

    if @item.save
      redirect_to root_path, notice: 'Congrats, that item is yours!'
    end
  end

  private

  def item_params
    params.require(:item).permit(:user_id)
  end

  def check_admin
    redirect_to root_path, alert: 'Employees Only. Sorry :(' unless current_user && current_user.admin
  end
end
