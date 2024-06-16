class MercadoPagoSdk
  require 'mercadopago'
  
  def initialize
    @access_token = ENV['MP_ACCESS_TOKEN']
  end

  def create_preference(line_items, shipping_details)
    mp = Mercadopago::SDK.new(@access_token)
    preference_data = {
      "back_urls": {
        "success": Rails.env.production? ? "https://yourapp.com/success" : "http://localhost:3000/success",
        "failure": Rails.env.production? ? "https://yourapp.com/cancel" : "http://localhost:3000/cancel",
      },
      "payer": {
        "address": {
          "zip_code" => shipping_details[:zip_code],
          "street_name" => shipping_details[:street_name],
          "street_number" => shipping_details[:street_number]
        },
        "email" => shipping_details[:email]
      },
      "metadata": line_items.each_with_index.to_h { |item, index| [index, item] },
      "currency_id": "PEN",
      "items": line_items
    }
    preference = mp.preference.create(preference_data)
    Rails.env.production? ? preference[:response]["init_point"] : preference[:response]["sandbox_init_point"]
  end
end