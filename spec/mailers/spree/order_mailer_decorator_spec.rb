require 'spec_helper'
require 'shared_examples_for_customized_email'

describe Spree::OrderMailer do
  let(:order) { build :order }
  let(:store) { mock_model Spree::Store }

  before { Spree::Order.any_instance.stub(:store) { store } }

  describe '.confirm_email' do
    subject { Spree::OrderMailer.confirm_email(order) }

    it_behaves_like "customized_email"
  end

  describe '.cancel_email' do
    subject { Spree::OrderMailer.cancel_email(order) }

    it_behaves_like "customized_email"
  end
end
