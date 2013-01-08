FactoryGirl.define do
  factory :store_email_template, :class => "Spree::StoreEmailTemplate" do
    store_id 1
    mailer_class_name "Spree::Mailer"
    template "This is the template"
    action "action"
    format "text"
  end
end

