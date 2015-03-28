json.array!(@product_retails) do |product_retail|
  json.extract! product_retail, :id, :product_name, :retail_name, :base_price
  json.url product_retail_url(product_retail, format: :json)
end
