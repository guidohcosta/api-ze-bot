class OrdersController < ApplicationController
  def track
    render json: { status: 'POSTADO' }
  end
end
