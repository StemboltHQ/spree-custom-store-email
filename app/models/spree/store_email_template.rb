class Spree::StoreEmailTemplate < ActiveRecord::Base
  belongs_to :store, class_name: 'Spree::Store'

  attr_accessible :store_id, :mailer_class_name, :text_template, :html_template, :action

  def self.search(class_name, store, action)
    where(mailer_class_name: class_name, store_id: store.id, action: action).first
  end
end
