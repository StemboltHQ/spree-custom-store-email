FactoryGirl.define do
  factory :store_email_template, :class => "Spree::StoreEmailTemplate" do
    store_id 1
    mailer_class_name "Spree::Mailer"
    action "action"
  end
end

