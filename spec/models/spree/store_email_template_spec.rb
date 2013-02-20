require 'spec_helper'

describe Spree::StoreEmailTemplate do
  let!(:template) { create :store_email_template, mailer_class_name: "MyMailerClass", store_id: store.id, action: "action" }
  let(:store) { mock_model Spree::Store, id: 1 }

  describe '.search' do
    context "when matching result exists" do
      it "finds the result" do
        Spree::StoreEmailTemplate.search("MyMailerClass", store, "action").should == template
      end
    end

    context "when matching result does not exist" do
      it "returns nil" do
        Spree::StoreEmailTemplate.search("nothing", store, "action").should be_nil
      end
    end
  end
end
