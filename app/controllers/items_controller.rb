class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def update
    @item = Item.find(params[:item][:id])
    @item.update_attributes(item_params)

    if @item.save
      redirect_to :index, notice: 'Congrats, that item is yours!'
    end
  end

  private

  def item_params
    params.require(:item).permit(:user_id)
  end
end
