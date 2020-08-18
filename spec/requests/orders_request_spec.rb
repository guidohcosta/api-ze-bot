require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:body) { JSON.parse(response.body) }

  describe '#track' do
    before { get '/orders/1/track' }

    it { expect(response).to have_http_status(:success) }
    it { expect(body).to include 'status' => 'POSTADO' }
  end

  describe '#index' do
    before do
      create_list(:order, 3)
      get '/orders'
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to all have_jsonapi_attributes(:client, :tracking, :status) }
  end

  describe '#show' do
    before do
      create_list(:order, 3)
      get '/orders/1'
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to have_jsonapi_attributes(:client, :tracking, :status) }
  end

  describe '#create' do
    let(:order_params) { attributes_for(:order) }
    before do
      post '/orders', params: { order: order_params }
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to have_jsonapi_attributes(:client, :tracking, :status) }
    it { expect(Order.count).to eq 1 }
  end

  describe '#update' do
    before do
      create(:order, client: "Nice client")
      patch '/orders/1', params: { order: { client: "Bad client" } }
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to have_jsonapi_attributes(:client, :tracking, :status) }
    it { expect(body['data']).to have_attribute(:client).with_value("Bad client") }
    it { expect(Order.count).to eq 1 }
  end

  describe '#destroy' do
    before do
      create(:order)
      delete '/orders/1'
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to have_jsonapi_attributes(:client, :tracking, :status) }
    it { expect(Order.count).to eq 0 }
  end
end
