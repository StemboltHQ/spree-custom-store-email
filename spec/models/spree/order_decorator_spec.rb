require 'spec_helper'

describe Spree::Order do
  let(:line_item) { build_stubbed :line_item }
  let(:adjustment) { build_stubbed :adjustment }
  let(:order) { build_stubbed :order, :line_items => [line_item], :adjustments => [adjustment] }

  describe '.to_hash' do
    subject { order.to_hash }

    before do
      order.stub(:display_total) { Spree::Money.new(10) }
      order.stub(:display_outstanding_balance) { Spree::Money.new(5) }
      order.stub(:display_item_total) { Spree::Money.new(8) }
      order.stub(:display_adjustment_total) { Spree::Money.new(2) }
      line_item.variant.stub(:display_price) { Spree::Money.new(1) }
      adjustment.stub(:display_amount) { Spree::Money.new(2) }
    end

    it { should be_a(Hash) }

    its(["display_total"]) { should == "$10.00" }
    its(["display_outstanding_balance"]) { should == "$5.00" }
    its(["display_item_total"]) { should == "$8.00" }
    its(["display_adjustment_total"]) { should == "$2.00" }

    it 'stores display_price for line items' do
      subject["line_items"].first["display_price"].should == "$1.00"
    end

    it 'stores display_amount for adjustments' do
      subject["adjustments"].first["display_amount"].should == "$2.00"
    end
  end
end
