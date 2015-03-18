class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
   @item = Item.new
  end

  def create
    @item = Item.new(params[:item])    
    #item = Book.new({name: params[:name]})
    
    if @item.save
      redirect_to '/items'#, notice: "Your new item was saved."
    else
       render '/items/new'
    end
    #new form comes here saves to db
  end

  def edit
    @item = Item.find(params[:id])
    #form to update
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(name: params[:name], price: params[:price],
     description: params[:description])
    # if @item.update_attributes(params[:item])
      redirect_to '/items', notice: "The item has now been updated."
         #
    #   render 'edit'
    # end
    #edit form updates db
  end

  def destroy
    @item= Item.find(params[:id])
    @item.destroy
    redirect_to '/items', notice: "This item has been deleted."
  end

end
