class HomeController < ApplicationController

  before_action :get_valid_upload, only: [:create]

  def index
    @data_upload = DataUpload.new
    @sales = Sale.all
  end

  def create
    @data_upload = get_valid_upload
    @data_upload.save_sales
    flash[:success] = 'Arquivo carregado'
    redirect_to root_path
  end

  def search
    @search_customer_name = params[:name]

    # vendor = Vendor.find_by_name( @search_vendor_name )
    # @sales =   Sale.from_vendor( vendor )

    customer = Customer.where "name like ?", "%#{@search_customer_name}%"

    @data_upload = DataUpload.new
    @sales = Sale.from_customer(customer)

    render "index"
  end

  private

  def redirect_root
  end

  def get_valid_upload
    @data_upload = DataUpload.new(upload_param)

    begin
      @data_upload.file_validate
    rescue Exception => e
      flash[:error] = "#{e.message}"
      redirect_to root_path
    end

    @data_upload
  end

  def upload_param
    params.require(:data_upload).permit(:dados)
  end

end
