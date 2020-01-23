class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @category_parent_array = ["--"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_size
    @sizes = Size.all
  end

  def create
    Item.create(item: item_params[:item])
    redirect_to "/new"
  end


  private

  def item_params
    params.permit(:item)
  end

end
