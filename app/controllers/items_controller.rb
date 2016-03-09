class ItemsController < ApplicationController
  def create
    @item = Item.create(params[:item].permit!)
    @item.user = current_user
    @item.save
    redirect_to root_url
  end

  def destroy
    @item = Item.find(params[:item])

    if @item.destroy
      flash[:notice] = "Item was deleted"
    else
      flash[:notice] = "Item couldn't be deleted. Try again."
    end
    redirect_to root_url

    respond_to do |format|
      format.html
      format.js
    end
  end

  def distance_of_time_in_words
    from_time = Time.now
    distance_of_time_in_words(from_time)
  end
end
