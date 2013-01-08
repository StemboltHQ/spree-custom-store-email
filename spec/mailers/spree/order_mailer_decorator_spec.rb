require 'spec_helper'

describe Spree::OrderMailer do
  let(:order) { create :order }
  let(:store) { mock_model Spree::Store }
  let(:template) { mock_model Spree::StoreEmailTemplate }

  before do
    Spree::Order.any_instance.stub(:store) { store }
    template.stub(:template) { "tpl_text" }
  end

  shared_examples_for "customized_email" do
    let(:text_template) { nil }
    let(:html_template) { nil }

    before do
      Spree::StoreEmailTemplate.stub(:text) { text_template }
      Spree::StoreEmailTemplate.stub(:html) { html_template }
    end

    context "when the text template does not exist" do
      it "renders the default template" do
        subject.body.should be_a(Mail::Body)
      end
    end

    context "when the text template exists" do
      let(:text_template) { template }

      it "renders the custom template" do
        subject.body.should == 'tpl_text'
      end
    end

    context "when the html template exists" do
      let(:html_template) { template }

      it "supplies a 2 part e-mail" do
        subject.parts.should have(2).parts
      end

      it 'has an html first part' do
        subject.parts.first.content_type.should == 'text/html; charset=UTF-8'
      end

      it 'has an text second part' do
        subject.parts.last.content_type.should == 'text/plain; charset=UTF-8'
      end

      it "uses the template for the html portion" do
        subject.parts.first.body.should == 'tpl_text'
      end
    end
  end

  describe '.confirm_email' do
    subject { Spree::OrderMailer.confirm_email(order) }

    it_behaves_like "customized_email"
  end

  describe '.cancel_email' do
    subject { Spree::OrderMailer.cancel_email(order) }

    it_behaves_like "customized_email"
  end
end
