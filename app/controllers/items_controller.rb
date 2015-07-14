class ItemsController < ApplicationController
  def index
    @items = Item.all
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
end
