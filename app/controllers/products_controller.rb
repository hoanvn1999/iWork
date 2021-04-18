class ProductsController < ApplicationController
  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
  end

  def create
    product = current_user.build(product_params)
    if product.save
      flash[:success] = "Tạo sản phẩm thành công"
      redirect_to products_path
    else
      flash.now[:warning] = "Tạo sản phẩm thất bại, vui lòng kiểm tra lại thông tin"
      render :new
    end
  end

  def edit
    @product = Product.find_by id: params[:id]
  end

  def update
    @product = Product.find_by id: params[:id]
    if product.update product_params
      flash[:success] = "Chỉnh sửa thông tin sản phẩm thành công"
      redirect_to products_path
    else
      flash.now[:warning] = "Chỉnh sửa thông tin sản phẩm thất bại, vui lòng kiểm tra lại thông tin"
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit :category_id, :name,
                                    :description, :price, :quantity
  end
end
