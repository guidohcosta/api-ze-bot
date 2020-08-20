require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:body) { JSON.parse(response.body) }
  let!(:product) { create(:product, name: "Nice name") }

  describe '#index' do
    before do
      get '/products'
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to all have_jsonapi_attributes(:name, :description, :price, :on_sale) }
  end

  describe '#show' do
    before do
      get "/products/#{product.id}"
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to have_jsonapi_attributes(:name, :description, :price, :on_sale) }
  end

  describe '#create' do
    let(:product_params) { attributes_for(:product) }
    before do
      post '/products', params: { product: product_params }
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to have_jsonapi_attributes(:name, :description, :price, :on_sale) }
    it { expect(Product.count).to eq 2 }
  end

  describe '#update' do
    before do
      patch "/products/#{product.id}", params: { product: { name: "New name" } }
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to have_jsonapi_attributes(:name, :description, :price, :on_sale) }
    it { expect(body['data']).to have_attribute(:name).with_value("New name") }
    it { expect(Product.count).to eq 1 }
  end

  describe '#destroy' do
    before do
      delete "/products/#{product.id}"
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(body['data']).to have_jsonapi_attributes(:name, :description, :price, :on_sale) }
    it { expect(Product.count).to eq 0 }
  end
end
