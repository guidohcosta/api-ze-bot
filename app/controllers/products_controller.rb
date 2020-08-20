class ProductsController < ApplicationController
  def index
    products = Product.search(params[:q]).result
    render json: ProductSerializer.
      new(products).
      serialized_json
  end

  def show
    product = Product.find(params.require(:id))
    render json: ProductSerializer.
      new(product).
      serialized_json
  end

  def create
    product = Product.new(product_params)
    product.save

    render json: ProductSerializer.
      new(product).
      serialized_json
  end

  def update
    product = Product.find(params.require(:id))
    product.update(product_params)

    render json: ProductSerializer.
      new(product).
      serialized_json
  end

  def destroy
    product = Product.find(params.require(:id))
    product.destroy

    render json: ProductSerializer.
      new(product).
      serialized_json
  end

  private

  def product_params
    params.
      require(:product).
      permit(%i[name description on_sale price])
  end
end
