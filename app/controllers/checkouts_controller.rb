class CheckoutsController < ApplicationController
  def create
    cart = params[:cart]
    
    line_items = cart.map do |item|
      product = Product.find(item["id"])
      product_stock = product.stocks.find { |stock| stock.size == item["size"] }
      if product_stock.amount < item["quantity"].to_i
        render json: { error: "Not enough stock for #{product.name} in size #{item["size"]}. Only #{product_stock.amount} left." }, status: 400
        return
      end

      {
        title: item["name"],
        quantity: item["quantity"].to_i,
        size: item["size"],
        product_id: product.id,
        product_stock_id: product_stock.id,
        unit_price: item["price"].to_i
      }
    end

    puts "line_items: #{line_items}"

    shipping_details = {
      street_name: params[:shipping_details][:street_name],
      street_number: params[:shipping_details][:street_number],
      email: params[:shipping_details][:email],
      zip_code: params[:shipping_details][:zip_code]
    }

    payment_url = MercadoPagoSdk.new.create_preference(line_items, shipping_details)
    render json: { url: payment_url }
  end

  def success
    render :success
  end

  def cancel
    render :cancel
  end
end