require 'spec_helper'

describe Spree::Shipment do
  let(:shipment) { build :shipment }
  let(:variant) { build :variant, :sku => sku }
  let(:sku) { "SKU-002" }
  let(:quantity) { 2 }

  before do
    shipment.stub(:manifest) { [OpenStruct.new(:variant => variant, :quantity => quantity)] }
  end

  describe '.to_hash' do
    subject { shipment.to_hash }

    it { should be_a(Hash) }

    specify { subject["manifest"].first["variant"]["sku"].should == sku }
    specify { subject["manifest"].first["quantity"].should == quantity }
  end
end
