json.array!(@product_retail_offers) do |product_retail_offer|
  json.extract! product_retail_offer, :id, :product_retail_id, :base_price, :offer, :expiry, :discounted_price
  json.url product_retail_offer_url(product_retail_offer, format: :json)
end
