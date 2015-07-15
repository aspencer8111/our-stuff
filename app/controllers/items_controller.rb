class ItemsController < ApplicationController
  before_filter :find_item, only: [:edit, :update]
  before_filter :check_admin, only: [:new, :edit]

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

  def edit
  end

  def update
    notice = 'Item has been updated'
    claiming_item_check

    @item.update_attributes(item_params)

    if @item.save
      redirect_to root_path, notice: notice
    else
      render :edit, notice: "Something went wrong"
    end
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :name, :description, :picture)
  end

  def check_admin
    redirect_to root_path, alert: 'Employees Only. Sorry :(' unless current_user && current_user.admin
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def claiming_item_check
    if params[:item][:user_id]
      params[:item][:user_id] = current_user.id
    end
  end
end
