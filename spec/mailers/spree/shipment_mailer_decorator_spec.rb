require 'spec_helper'
require 'shared_examples_for_customized_email'

describe Spree::ShipmentMailer do
  let(:shipment) { build :shipment, :order => order }
  let(:store) { mock_model Spree::Store }
  let(:order) { mock_model Spree::Order, :store => store }
  let(:class_name) { "Spree::ShipmentMailer" }
  before { order.stub(:store_name) { "Store Name" } }

  before do
    Spree::StoreEmailTemplate.should_receive(:search).with(class_name, store, action).and_return(template)
  end

  describe '.shipped_email' do
    let(:action) { :shipped_email }

    subject { Spree::ShipmentMailer.shipped_email(shipment) }

    it_behaves_like "customized_email"
  end
end
