require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'attributes' do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :on_sale }
    it { is_expected.to respond_to :price }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end
end
