class OrdersController < ApplicationController
  def track
    render json: { status: 'POSTADO' }
  end

  def index
    orders = Order.all
    render json: OrderSerializer.
      new(orders).
      serialized_json
  end

  def show
    order = Order.find(params.require(:id))
    render json: OrderSerializer.
      new(order).
      serialized_json
  end

  def create
    order = Order.new(order_params)
    order.save

    render json: OrderSerializer.
      new(order).
      serialized_json
  end

  def update
    order = Order.find(params.require(:id))
    order.update(order_params)

    render json: OrderSerializer.
      new(order).
      serialized_json
  end

  def destroy
    order = Order.find(params.require(:id))
    order.destroy

    render json: OrderSerializer.
      new(order).
      serialized_json
  end

  private

  def order_params
    params.
      require(:order).
      permit(%i[client tracking status_cd status])
  end
end
