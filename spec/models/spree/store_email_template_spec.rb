require 'spec_helper'

describe Spree::StoreEmailTemplate do
  describe 'scopes' do
    let!(:html_template) { create :store_email_template, :format => "html" }
    let!(:text_template) { create :store_email_template, :format => "text" }

    describe '#html' do
      subject { Spree::StoreEmailTemplate.html(nil) }
      it { should == html_template }
    end

    describe '#text' do
      subject { Spree::StoreEmailTemplate.text(nil) }
      it { should == text_template }
    end
  end
end
