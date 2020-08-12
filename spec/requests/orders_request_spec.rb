require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:body) { JSON.parse(response.body) }

  describe '#track' do
    before { get '/orders/1/track' }

    it { expect(response).to have_http_status(:success) } 
    it { expect(body).to include 'status' => 'POSTADO' }
  end
end
