class InvoicesController < ApplicationController
  def index
    @invoices = current_user.invoices
  end
  def new
    @invoice = Invoice.new
  end

  def create
    invoice = Invoice.new invoice_params
    if invoice.save
      flash[:success] = "Tạo hóa đơn thành công"
      redirect_to invoices_path
    else
      flash.now[:warning] = "Tạo hóa đơn thất bại, vui lòng kiểm tra lại thông tin"
      render :new
    end
  end

  def edit
    @invoice = Invoice.find_by id: params[:id]
  end

  def update
    @invoice = Invoice.find_by id: params[:id]
    if invoice.update(quantity: params[:quantity])
      flash[:success] = "Chỉnh sửa thông tin thành công"
      redirect_to invoices_path
    else
      flash.now[:warning] = "Chỉnh sửa thông tin thất bại, vui lòng kiểm tra lại thông tin"
      render :edit
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit :product_id, :quantity,
                                    :current_price
  end
end
