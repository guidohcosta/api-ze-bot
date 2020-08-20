require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:body) { JSON.parse(response.body) }
  let!(:order) { create(:order, client: 'Nice client') }

  describe '#track' do
    before do
      get "/orders/#{order.code}/track"
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body).to include 'status' => 'POSTADO' }
  end

  describe '#index' do
    before do
      get '/orders'
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to all have_jsonapi_attributes(:client, :tracking, :status, :code) }
  end

  describe '#show' do
    before do
      get "/orders/#{order.id}"
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to have_jsonapi_attributes(:client, :tracking, :status, :code) }
  end

  describe '#create' do
    let(:order_params) { attributes_for(:order) }
    before do
      post '/orders', params: { order: order_params }
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to have_jsonapi_attributes(:client, :tracking, :status, :code) }
    it { expect(Order.count).to eq 2 }
  end

  describe '#update' do
    before do
      patch "/orders/#{order.id}", params: { order: { client: "Bad client" } }
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to have_jsonapi_attributes(:client, :tracking, :status, :code) }
    it { expect(body['data']).to have_attribute(:client).with_value("Bad client") }
    it { expect(Order.count).to eq 1 }
  end

  describe '#destroy' do
    before do
      delete "/orders/#{order.id}"
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to have_jsonapi_attributes(:client, :tracking, :status, :code) }
    it { expect(Order.count).to eq 0 }
  end
end
