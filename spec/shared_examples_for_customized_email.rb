require 'spec_helper'

shared_examples_for "customized_email" do
  let(:text_template) { nil }
  let(:html_template) { nil }
  let(:template) { mock_model Spree::StoreEmailTemplate }

  before do
    Spree::StoreEmailTemplate.stub(:text) { text_template }
    Spree::StoreEmailTemplate.stub(:html) { html_template }
    template.stub(:template) { "tpl_text" }
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
