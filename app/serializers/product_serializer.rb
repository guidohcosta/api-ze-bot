class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :price, :on_sale
end
