Spree::Store.class_eval do
  has_many :store_email_templates, class_name: 'Spree::StoreEmailTemplate'
  alias_method :email_templates, :store_email_templates
  alias_method :email_templates=, :store_email_templates=
end
