require 'spec_helper'
require 'shared_examples_for_customized_email'

describe Spree::OrderMailer do
  let(:order) { build :order }
  let(:store) { mock_model Spree::Store }
  let(:class_name) { "Spree::OrderMailer" }

  before do
    Spree::Order.any_instance.stub(:store) { store }
    Spree::StoreEmailTemplate.should_receive(:search).with(class_name, store, action).and_return(template)
  end

  describe '.confirm_email' do
    subject { Spree::OrderMailer.confirm_email(order) }
    let(:action) { :confirm_email }

    it_behaves_like "customized_email"
  end

  describe '.cancel_email' do
    subject { Spree::OrderMailer.cancel_email(order) }
    let(:action) { :cancel_email }

    it_behaves_like "customized_email"
  end
end
