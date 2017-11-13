class SalesController < ApplicationController
  before_action :set_sale, only: [:show]

  # GET /sales
  # GET /sales.json
  def index
    @gross_revenue = Sale.sum(:sale_total)
    @sales = Sale.order('created_at desc').page params[:page]
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # POST /sales/upload
  def upload
    file = params[:file]
    parsed_file = Utils::SalesParser.parse(file.tempfile)
    parsed_file.each do |line|
      price, count = line[2].to_f, line[3].to_i
      Sale.create(purchaser_name: line[0], item_description: line[1],
                  item_price: price, purchase_count: count,
                  merchant_address: line[4], merchant_name: line[5],
                  sale_total: price * count)
    end
    redirect_to :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:file)
    end
end
