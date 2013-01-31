require 'spec_helper'
require 'shared_examples_for_customized_email'

describe Spree::ShipmentMailer do
  let(:shipment) { build :shipment, :order => order }
  let(:store) { mock_model Spree::Store }
  let(:order) { mock_model Spree::Order, :store => store }
  before { order.stub(:store_name) { "Store Name" } }

  describe '.confirm_email' do
    subject { Spree::ShipmentMailer.shipped_email(shipment) }

    it_behaves_like "customized_email"
  end
end
