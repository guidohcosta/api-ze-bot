require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'attributes' do
    it { is_expected.to respond_to :client }
    it { is_expected.to respond_to :status }
    it { is_expected.to respond_to :tracking }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of :tracking }
  end
end
