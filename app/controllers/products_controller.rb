class ProductsController < ApplicationController
  def index
    @all_products = Product.page(params[:page])
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(params[:product])
      if @product.save
        redirect_to products_path(@product)
      else
        render :new
      end
    @product.user_id = session[:id]
    @product.save
  end
  def show
    @product = Product.find(params[:id])
    @product_name = @product.name
    @product_condition = @product.condition
    @product_photo_url = @product.photo
    @product_owner = User.find(@product.user_id)
    @product_added = @product.created_at
    @product_description = @product.description

    if !@authenticated_user.nil?
      @authenticated_user_products_array = @authenticated_user.products.map {|p| [p.name, p.id]}
    end
  end
  def edit
    @product = Product.find(params[:id])
    if @product.user_id != session[:id]
      redirect_to products_path
    end
  end
  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      redirect_to product_path(@product)
    else
      render :edit
    end
  end
  def search
      query = params[:query]
      if query.present?
          @all_products = Product.text_search(query).page(params[:page])
      else
          @all_products = Product.page(params[:page])
      end
    end
  def destroy
    @product = Product.find(params[:id])
    if @product.user_id != session[:id]
      redirect_to products_path
    else
      product = Product.find(params[:id])
        product.delete
        redirect_to products_path
    end
  end
end